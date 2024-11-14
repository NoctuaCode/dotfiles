#!/bin/bash

# Colors for better visibility
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

check_brew() {
    if command -v brew >/dev/null 2>&1; then
        echo -e "${GREEN}Homebrew is installed${NC}"
        echo -e "Version: ${YELLOW}$(brew --version)${NC}"
        return 0
    else
        echo -e "${YELLOW}Homebrew is not installed${NC}"
        return 1
    fi
}

install_brew() {
    echo -e "${YELLOW}Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

check_dotfiles_path() {
    local current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    
    # Check if DOTFILES_PATH is in .zshrc
    if ! grep -q "export DOTFILES_PATH=" ~/.zshrc; then
        echo -e "${YELLOW}Adding DOTFILES_PATH to .zshrc...${NC}"
        echo -e "\n# Dotfiles path" >> ~/.zshrc
        echo "export DOTFILES_PATH=\"$current_dir\"" >> ~/.zshrc
        echo -e "${GREEN}Added DOTFILES_PATH to .zshrc${NC}"
    else
        echo -e "${GREEN}DOTFILES_PATH already exists in .zshrc${NC}"
    fi
}

# Main script
check_brew
if [ $? -eq 1 ]; then
    install_brew
fi

# Check and add DOTFILES_PATH before copying .zshrc
check_dotfiles_path

# Copy and source zshrc
echo -e "${YELLOW}Copying .zshrc file...${NC}"
if cp -f zshrc/.zshrc ~/.zshrc; then
    echo -e "${GREEN}Successfully copied .zshrc${NC}"
    # Source in a subshell to avoid script termination
    (source ~/.zshrc)
else
    echo -e "${RED}Failed to copy .zshrc${NC}"
fi

# Update Homebrew
echo -e "${YELLOW}Updating Homebrew...${NC}"
brew update && brew upgrade

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FORMULA_FILE="$SCRIPT_DIR/formula.txt"
CASK_FILE="$SCRIPT_DIR/cask.txt"

echo -e "${YELLOW}Installing formulas...${NC}"
while read -r formula || [ -n "$formula" ]; do
    [ -z "$formula" ] && continue
    echo -e "${YELLOW}Installing formula: ${formula}...${NC}"
    if brew install --formula "$formula"; then
        echo -e "${GREEN}Successfully installed $formula${NC}"
    else
        echo -e "${RED}Failed to install $formula${NC}"
    fi
done < "$FORMULA_FILE"
echo -e "${GREEN}Formula installation complete!${NC}"

echo -e "${YELLOW}Installing casks...${NC}"
while read -r cask || [ -n "$cask" ]; do
    [ -z "$cask" ] && continue
    echo -e "${YELLOW}Installing cask: ${cask}...${NC}"
    if brew install --cask "$cask"; then
        echo -e "${GREEN}Successfully installed $cask${NC}"
    else
        echo -e "${RED}Failed to install $cask${NC}"
    fi
done < "$CASK_FILE"
echo -e "${GREEN}Cask installation complete!${NC}"

# Check for stow
if ! command -v stow &> /dev/null; then
    echo -e "${RED}Error: stow is not installed${NC}"
    exit 1
fi

# Stow configuration
echo -e "${YELLOW}Starting stow operations...${NC}"
for d in */; do
    if [ -d "$d" ]; then
        dir_name="${d%/}"  # Remove trailing slash
        echo -e "${YELLOW}Processing ${dir_name}...${NC}"
        
        # Remove existing config if present
        if [ -d "$HOME/.config/${dir_name}" ]; then
            echo -e "${YELLOW}Removing existing config for ${dir_name}...${NC}"
            rm -rf "$HOME/.config/${dir_name}"
        fi
        
        # Stow the directory
        if stow "${dir_name}" --adopt; then
            echo -e "${GREEN}Successfully stowed ${dir_name}${NC}"
        else
            echo -e "${RED}Failed to stow ${dir_name}${NC}"
        fi
    fi
done

echo -e "${GREEN}Setup completed successfully!${NC}"

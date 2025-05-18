#! /bin/bash

# Create symlinks for config files and directories
for item in config/*; do
    if [ -e "$item" ]; then
        basename=$(basename "$item")
        # Skip .stowrc and .DS_Store files
        if [[ "$basename" != ".stowrc" && "$basename" != ".DS_Store" ]]; then
            # Remove existing symlink or directory
            rm -rf "$HOME/.config/$basename"
            # Create new symlink
            ln -sf "$(pwd)/$item" "$HOME/.config/$basename"
        fi
    fi
done

# Get OS type
if [[ "$OSTYPE" == "darwin"* ]]; then
    # MacOS
    vscode_path="$HOME/Library/Application Support/Code/User"
    cursor_path="$HOME/Library/Application Support/Cursor/User"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    vscode_path="$HOME/.config/Code/User"
    cursor_path="$HOME/.config/Cursor/User" 
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows
    vscode_path="$APPDATA/Code/User"
    cursor_path="$APPDATA/Cursor/User"
else
    echo "Unsupported operating system"
    exit 1
fi

# Create directories if they don't exist
mkdir -p "$vscode_path"
mkdir -p "$cursor_path"

# Create symlinks for VS Code and Cursor configs
for item in vscode/*; do
    if [ -e "$item" ]; then
        basename=$(basename "$item")
        rm -rf "$vscode_path/$basename"
        rm -rf "$cursor_path/$basename"
         
        # Create symlinks for both VS Code and Cursor
        ln -sf "$(pwd)/$item" "$vscode_path/$basename"
        ln -sf "$(pwd)/$item" "$cursor_path/$basename"
    fi
done

rm -f "$HOME/.zshrc"
ln -sf "$(pwd)/zshrc/.zshrc" "$HOME/.zshrc"
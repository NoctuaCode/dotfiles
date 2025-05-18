#! /bin/bash

# Install Cursor
# Create applications directory if it doesn't exist
if [ ! -d "$HOME/Applications" ]; then
    mkdir -p "$HOME/Applications"
fi

if [ ! -d "$HOME/Applications/Cursor" ]; then
    mkdir "$HOME/Applications/Cursor"
    wget -O "$HOME/Applications/Cursor/Cursor.AppImage" "https://www.cursor.com/download/stable/linux-x64"
    sudo chmod +x "$HOME/Applications/Cursor/Cursor.AppImage"
    wget -O "$HOME/Applications/Cursor/cursor.png" "https://www.cursor.com/apple-touch-icon.png"

    # Create desktop file
    sudo echo "[Desktop Entry]
    Name=Cursor
    Exec=$HOME/Applications/Cursor/Cursor.AppImage
    Icon=$HOME/Applications/Cursor/cursor.png
    Type=Application
    Categories=Development;
    " > "/usr/share/applications/cursor.desktop"
fi

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

vscode_path="$HOME/.config/Code/User"
cursor_path="$HOME/.config/Cursor/User" 

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

rm -f "$HOME/.bashrc"
ln -sf "$(pwd)/bashrc/.bashrc" "$HOME/.bashrc"
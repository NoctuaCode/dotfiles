#!/bin/bash

SUDO_TEMPLATE="/etc/pam.d/sudo_local.template"
SUDO_LOCAL="/etc/pam.d/sudo_local"

if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm" && \
    "$HOME/.config/tmux/plugins/tpm/bin/install_plugins"
fi

echo "TMUX TPM DONE"

# Finder settings
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "ShowStatusBar" -bool "true"
killall Finder

echo "Finder Done"

# Docker settings
defaults write com.apple.dock "appswitcher-all-displays" -bool "true"
defaults write com.apple.dock "persistent-apps" -array
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-delay" 0.1
defaults write com.apple.dock "launchanim" -bool "false"
defaults write com.apple.dock "magnification" -bool "false"
defaults write com.apple.dock "mineffect" -string "suck"
defaults write com.apple.dock "showhidden" -bool "true"
defaults write com.apple.dock "show-process-indicators" -bool "false"
defaults write com.apple.dock "static-only" -bool "true"
defaults write com.apple.dock "expose-group-apps" -bool "true"
killall Dock

echo "Dock done"

# GlobalDomain settings
defaults write -globalDomain "AppleICUForce24HourTime" -bool "true"
defaults write -globalDomain "AppleInterfaceStyle" -string "Dark"
defaults write -globalDomain "KeyRepeat" -int "2"
defaults write -globalDomain "com.apple.keyboard.fnState" -bool "false"

echo "Other conf Done"

# Check and add pam_reattach.so line if not present
if ! grep -q "^auth.*optional.*pam_reattach.so" "$SUDO_TEMPLATE"; then
    echo "auth     optional     /opt/homebrew/lib/pam/pam_reattach.so" >> "$SUDO_TEMPLATE"
fi

echo "pam done"

# Check and add pam_tid.so line if not present
if ! grep -q "^auth.*sufficient.*pam_tid.so" "$SUDO_TEMPLATE"; then
    echo "auth       sufficient     pam_tid.so" >> "$SUDO_TEMPLATE"
fi

echo "pam tmux done"

if [ ! -f "$SUDO_LOCAL" ] && [ -f "$SUDO_TEMPLATE" ]; then
    cp "$SUDO_TEMPLATE" "$SUDO_LOCAL"
fi

echo "sudo done"

echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai

echo -e "${GREEN}Setup completed successfully!${NC}"

exit 1

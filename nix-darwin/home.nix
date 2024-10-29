# home.nix
# home-manager switch

{ config, pkgs, ... }:

{
    home.username = "noctuacode";
    home.homeDirectory = "/Users/noctuacode";
    home.stateVersion = "24.05";

    home.packages = [
    ];

    home.file = {
        ".config/aerospace".source = ~/dotfiles/aerospace;
        ".config/bin".source = ~/dotfiles/bin;
        ".config/karabiner".source = ~/dotfiles/karabiner;
        ".config/nix".source = ~/dotfiles/nix;
        ".config/nix-darwin".source = ~/dotfiles/nix-darwin;
        ".config/nvim".source = ~/dotfiles/nvim;
        ".config/sesh".source = ~/dotfiles/sesh;
        ".config/starship".source = ~/dotfiles/starship;
        ".config/tmux".source = ~/dotfiles/tmux;
        ".config/wezterm".source = ~/dotfiles/wezterm;
        ".config/zed".source = ~/dotfiles/zed;
        ".zshrc".source = ~/dotfiles/zshrc/.zshrc;
    };

    home.sessionVariables = {
    };

    home.sessionPath = [
        "/run/current-system/sw/bin"
        "$HOME/.nix-profile/bin"
    ];
    programs.home-manager.enable = true;
    programs.zsh = {
        enable = true;
        initExtra = ''
        # Add any additional configurations here
        export PATH=/run/current-system/sw/bin:$HOME/.nix-profile/bin:$PATH
        if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
            . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
        fi
        '';
    };
}

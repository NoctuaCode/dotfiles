# home.nix
# home-manager switch 

{ config, pkgs, ... }:

{
  home.username = "noctuacode";
  home.homeDirectory = "/Users/noctuacode";
  home.stateVersion = "23.05"; # Please read the comment before changing.

# Makes sense for user specific applications that shouldn't be available system-wide
  home.packages = [
  ];

  # Home Manager is pretty good at managing dotfile. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".zshrc".source = /Users/noctuacode/dotfile/zshrc/.zshrc;
    ".config/wezterm".source = /Users/noctuacode/dotfile/wezterm;
    ".config/karabiner".source = /Users/noctuacode/dotfile/karabiner;
    ".config/kitty".source = /Users/noctuacode/dotfile/kitty;
    ".config/skhd".source = /Users/noctuacode/dotfile/skhd;
    ".config/starship".source = /Users/noctuacode/dotfile/starship;
    ".config/zellij".source = /Users/noctuacode/dotfile/zellij;
    ".config/nvim".source = /Users/noctuacode/dotfile/nvim;
    ".config/nix".source = /Users/noctuacode/dotfile/nix;
    ".config/nix-darwin".source = /Users/noctuacode/dotfile/nix-darwin;
    ".config/tmux".source = /Users/noctuacode/dotfile/tmux;
    ".config/yabai".source = /Users/noctuacode/dotfile/yabai;
    ".config/zed".source = /Users/noctuacode/dotfile/zed;
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

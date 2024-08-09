{
  description = "My Darwin Nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
          pkgs.vim
          pkgs.direnv
          pkgs.age
          pkgs.sshs
          pkgs.atac
          pkgs.portal
          pkgs.glow
          pkgs.skhd
        ];

      services.yabai = {
          enable = true;
          package = pkgs.yabai;
          enableScriptingAddition = true;
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Use touchID for sudo
      security.pam.enableSudoTouchIdAuth = true;

      # home
      users.users.noctuacode.home = "/Users/noctuacode";
      home-manager.backupFileExtension = "backup";
      nix.configureBuildUsers = true;
      nix.useDaemon = true;

      # Manage system defaults
      system.defaults = {
        finder = {
          AppleShowAllFiles = true;
          AppleShowAllExtensions = true;
          FXPreferredViewStyle = "clmv";
          FXEnableExtensionChangeWarning = false;
          ShowPathbar = true;
          ShowStatusBar = true;
        };
        dock = {
          autohide = true;
          mru-spaces = false;
          minimize-to-application = true;
          show-recents = false;
        };
        NSGlobalDomain = {
          AppleICUForce24HourTime = false;
          AppleInterfaceStyle = "Dark";
          AppleInterfaceStyleSwitchesAutomatically = false;
          ApplePressAndHoldEnabled = false;
          KeyRepeat = 2;
          InitialKeyRepeat = 15;
          NSAutomaticCapitalizationEnabled = false;
          NSAutomaticDashSubstitutionEnabled = false;
          NSAutomaticPeriodSubstitutionEnabled = false;
          NSAutomaticQuoteSubstitutionEnabled = false;
        };
        trackpad = {
            Clicking = true;
            TrackpadThreeFingerDrag = true;
        };
        loginwindow.LoginwindowText = "Noctua Code";
        screencapture.location = "~/Pictures/screenshots";
        screensaver.askForPasswordDelay = 10;
        menuExtraClock = {
          IsAnalog = false;
          ShowDate = 1;
          ShowSeconds = true;
          Show24Hour = false;
          ShowAMPM = true;
        };
      };

      # Homebrew needs to be installed on its own!
      homebrew.enable = true;
      homebrew.casks = [
	    "wireshark"
        "google-chrome"
        "herd"
        "arc"
        "kitty"
        "zed"
        "karabiner-elements"
        "shottr"
        "1password"
        "1password-cli"
        "cleanmymac"
        "visual-studio-code"
      ];
      homebrew.brews = [
	      "imagemagick"
      ];
    };
  in
{
    darwinConfigurations."NoctuaCodes-MacBook-Air" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
	configuration
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.noctuacode = import ./home.nix;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."NoctuaCodes-MacBook-Air".pkgs;
  };
}

if status is-interactive
    # Theme
    source "$HOME/.config/fish/config/tokyonight.fish"

    # Mise
    /opt/homebrew/bin/mise activate fish | source

    # Homebrew
    /opt/homebrew/bin/brew shellenv | source

    # Bun
    set -x BUN_INSTALL $HOME/.bun
    set PATH $PATH $BUN_INSTALL/bin

    # Carapace
    set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
    carapace _carapace | source

    # FZF
    fzf --fish | source

    # GO
    set -x GOPATH $HOME/go
    set -x PATH $PATH $GOPATH/bin

    # Kube
    kubectl completion fish | source

    # Postgres
    set -x PATH $PATH /opt/homebrew/opt/postgresql@17/bin

    set -x PATH $PATH $HOME/.cargo/bin

    zoxide init fish | source

    source $HOME/.config/fish/config/aliases.fish
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/caulotte/.lmstudio/bin
# End of LM Studio CLI section

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

string match -q "$TERM_PROGRAM" kiro and . (kiro --locate-shell-integration-path fish)

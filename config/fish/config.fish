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

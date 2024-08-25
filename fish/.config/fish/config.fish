set fish_greeting = ""

set -gx TERM xterm-256color

set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

alias ll "eza -l -g --icons"
alias lla "ll -a"
alias lt "ll --tree"
alias lta "ll --tree -a"

alias g git
alias c clear

alias bi "brew install"
alias bic "brew install --cask"
alias br "brew remove"
alias bs "brew search"
alias buu "brew update && brew upgrade"

command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/.bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.config/bin $PATH
set -gx PATH ~/.cargo/bin $PATH

set -gx PATH node_modules/.bin $PATH
set -gx PATH .venv/bin $PATH

set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /opt/homebrew/Caskroom/miniconda/base/bin $PATH
    end
end
# <<< conda initialize <<<

# Set up fzf key bindings
fzf --fish | source

zoxide init fish --cmd cd | source

load_nvm >/dev/stderr

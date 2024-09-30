# Homebrew
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Go
export GOPATH=$HOME/go

# Extend PATH
export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.config/emacs/bin:$(go env GOPATH)/bin:"/Users/noctuacode/Library/Application Support/Herd/bin/":/opt/homebrew/opt/llvm/bin:$PATH

# CONDA
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup

# HERD
# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/noctuacode/Library/Application Support/Herd/config/php/82/"

# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/noctuacode/Library/Application Support/Herd/config/php/74/"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/noctuacode/Library/Application Support/Herd/config/php/83/"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="headline"
export XDG_CONFIG_HOME=$HOME/.config

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

source $ZSH/oh-my-zsh.sh

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# use colorls instead of ls
alias ls="eza --icons -F -H --group-directories-first --git"
alias ll="ls -al"
alias lt="ls -T --git-ignore"
alias lta="ls -Ta"

# Brew command
alias bu="brew update"
alias buu="brew update && brew upgrade"
alias bi="brew install"
alias bic="brew install --cask"
alias bs="brew search"
alias br="brew remove"

alias c="clear"
alias n="nvim"

kill_port() {
    local port="$1"
    if [ -z "$port" ]; then
        echo "Usage: kill_process_by_port <port_number>"
        return 1
    fi
    
    local pid=$(lsof -ti :"$port")
    if [ -z "$pid" ]; then
        echo "No process found using port $port"
        return 1
    fi
    
    echo "Killing process $pid using port $port"
    kill -9 "$pid"
    
    if [ $? -eq 0 ]; then
        echo "Process successfully terminated"
    else
        echo "Failed to terminate process"
        return 1
    fi
}

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

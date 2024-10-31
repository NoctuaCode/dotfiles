setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit
bindkey -e

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Homebrew
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export LANG=en_US.UTF-8

export EDITOR=/opt/homebrew/bin/nvim

# Go
export GOPATH=$HOME/go

# Extend PATH
# With local
export PATH=$HOME/.local/bin:$PATH
# With Rust
export PATH=$HOME/.cargo/bin:$PATH
# With emacs
export PATH=$HOME/.config/emacs/bin:$PATH
# With Go
export PATH=$(go env GOPATH)/bin:$PATH
# With Herd
export PATH="/Users/noctuacode/Library/Application Support/Herd/bin/":$PATH
# With LLVM
export PATH=/opt/homebrew/opt/llvm/bin:$PATH

export PATH=/opt/homebrew/Cellar/avr-gcc@8/8.5.0_2/bin:$PATH
export PATH=/opt/homebrew/Cellar/arm-none-eabi-gcc@8/8.5.0_2/bin:$PATH
export PATH=/opt/homebrew/Cellar/arm-none-eabi-binutils/2.41/bin:$PATH
export DOTFILES_PATH=$HOME/dotfile-main

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

export XDG_CONFIG_HOME=$HOME/.config

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# export STARSHIP_CONFIG=~/.config/starship/starship.toml

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
eval "$(direnv hook zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# use colorls instead of ls
alias ls="eza --icons -F -H --group-directories-first --git"
alias ll="ls -al"
alias lt="ls -T --git-ignore"
alias lta="ls -Ta"

alias c="clear"
alias vim="nvim"
alias cat="bat"

alias bl="brew list"
alias bs="brew search"
alias buu="brew update && brew upgrade"

alias ga="git add -p"
alias gb="git branch"
alias gc="git commit -m"
alias gdiff="git diff"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gp="git pull --rebase"
alias gP="git push"
alias gs="git status"
alias gS="git switch"

bindkey jj vi-cmd-mode

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

bi() {
    brew install "$1" && brew list --formula --full-name > "$DOTFILES_PATH/formula.txt" && brew list --cask --full-name > "$DOTFILES_PATH/cask.txt"
}

br() {
    brew uninstall "$1" && brew list --formula --full-name > "$DOTFILES_PATH/formula.txt" && brew list --cask --full-name > "$DOTFILES_PATH/cask.txt"
}

bic() {
    brew install --cask "$1" && brew list --formula --full-name > "$DOTFILES_PATH/formula.txt" && brew list --cask --full-name > "$DOTFILES_PATH/cask.txt"
}

eval "$(starship init zsh)"

# Homebrew
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    git-auto-fetch
    brew
    direnv
    fzf
    golang
    macos
    npm
    pip
    python
    sudo
    tmux
    vi-mode
    virtualenv
    zoxide
)

case "$TERM" in
    xterm-color|*-256color|xterm-ghostty) color_prompt=yes;;
esac

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

export EDITOR=nvim

# Go
export GOPATH=$HOME/go

# Extend PATH
# With local
export PATH=$PATH:$HOME/.config/bin
# With Rust
export PATH=$PATH:$HOME/.cargo/bin
# With Go
export PATH=$PATH:$(go env GOPATH)/bin
# With LLVM
export PATH=$PATH:/opt/homebrew/opt/llvm/bin
export PATH=$PATH:$HOME/.emacs.d/bin
export PATH=$PATH:/Library/TeX/texbin

export PATH=$PATH:/opt/homebrew/Cellar/avr-gcc@8/8.5.0_2/bin
export PATH=$PATH:/opt/homebrew/Cellar/arm-none-eabi-gcc@8/8.5.0_2/bin
export PATH=$PATH:/opt/homebrew/Cellar/arm-none-eabi-binutils/2.41/bin
export PATH=$PATH:/opt/homebrew/lib/ruby/gems/3.4.0/bin
export PATH=$PATH:/opt/homebrew/opt/ruby/bin
export PATH=$PATH:$HOME/.local/bin

export XDG_CONFIG_HOME=/Users/noctuapps/.config

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
eval "$(starship init zsh)"

# use colorls instead of ls
alias ls="eza --icons -F -H --group-directories-first --git"
alias ll="ls -al"
alias lt="ls -T --git-ignore"
alias lta="ls -Ta"

alias c="clear"
alias v="nvim"
alias cat="bat"

alias rmdir="rm -rf"
alias cpdir="cp -rf"

alias bl="brew list"
alias bs="brew search"
alias buu="brew update && brew upgrade"

alias g="git"
alias gaa="git add ."
alias ga="git add -p"
alias gb="git branch"
alias gc="git commit -m"
alias gca="git commit -am"
alias gdiff="git diff"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gp="git pull --rebase"
alias gP="git push origin"
alias gs="git status"
alias gS="git switch"

alias k="kubectl"

alias ts="tmux-sessionizer"

function mkcd() {
  mkdir $1 && cd $1
}

function ss() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

function sz() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -z | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

function sp() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

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

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/noctuapps/.cache/lm-studio/bin"

export OLLAMA_FLASH_ATTENTION=true
export OLLAMA_KV_CACHE_TYPE=f16


export PATH="$PATH:/opt/homebrew/opt/postgresql@17/bin"


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/noctuapps/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP binary.
export PATH="$PATH:/Users/noctuapps/Library/Application Support/Herd/bin/"

# bun completions
[ -s "/Users/noctuapps/.bun/_bun" ] && source "/Users/noctuapps/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$PATH:$BUN_INSTALL/bin

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load Angular CLI autocompletion.
source <(ng completion script)
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/noctuapps/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# pnpm
export PNPM_HOME="/Users/noctuapps/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}

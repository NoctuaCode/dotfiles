# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
    git
    git-auto-fetch
    brew
    direnv
    docker
    docker-compose
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

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

export EDITOR=zed

# Go
export GOPATH=$HOME/go

# Extend PATH
# With local
export PATH=$HOME/.config/bin:$PATH
# With Rust
export PATH=$HOME/.cargo/bin:$PATH
# With emacs
export PATH=$HOME/.config/emacs/bin:$PATH
# With Go
export PATH=$(go env GOPATH)/bin:$PATH
# With LLVM
export PATH=/opt/homebrew/opt/llvm/bin:$PATH

export PATH=/opt/homebrew/Cellar/avr-gcc@8/8.5.0_2/bin:$PATH
export PATH=/opt/homebrew/Cellar/arm-none-eabi-gcc@8/8.5.0_2/bin:$PATH
export PATH=/opt/homebrew/Cellar/arm-none-eabi-binutils/2.41/bin:$PATH
export DOTFILES_PATH=$HOME/dotfiles

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
export PATH="$PATH:/Users/caulotte/.cache/lm-studio/bin"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/caulotte/Library/Application Support/Herd/config/php/83/"

# Herd injected PHP binary.
export PATH="/Users/caulotte/Library/Application Support/Herd/bin/":$PATH

# >>> conda initialize >>>
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
# <<< conda initialize <<<

# pnpm
export PNPM_HOME="/Users/caulotte/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export OLLAMA_FLASH_ATTENTION=true
export OLLAMA_KV_CACHE_TYPE=f16


# Load Angular CLI autocompletion.
source <(ng completion script)

export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

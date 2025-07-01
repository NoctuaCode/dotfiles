# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew
source $HOME/.config/zsh/homebrew

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

case "$TERM" in
    xterm-color|*-256color|xterm-ghostty) color_prompt=yes;;
esac

export LANG=en_US.UTF-8

export EDITOR=nvim

export XDG_CONFIG_HOME=$HOME/.config

export PATH=$PATH:$HOME/.config/bin
export PATH=$PATH:$HOME/.emacs.d/bin
export PATH=$PATH:$HOME/.local/bin


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
autoload -Uz compinit
compinit

source $HOME/.config/zsh/powerlevel10k
source $HOME/.config/zsh/oh-my-zsh
source $HOME/.config/zsh/carapace
source $HOME/.config/zsh/go
source $HOME/.config/zsh/rust
source $HOME/.config/zsh/fzf
source $HOME/.config/zsh/zoxide
source $HOME/.config/zsh/direnv
source $HOME/.config/zsh/shellenv
source $HOME/.config/zsh/functions
source $HOME/.config/zsh/ollama
source $HOME/.config/zsh/postgres
source $HOME/.config/zsh/herd
source $HOME/.config/zsh/bun
source $HOME/.config/zsh/docker
source $HOME/.config/zsh/atuin
source $HOME/.config/zsh/pnpm
source $HOME/.config/zsh/starship
source $HOME/.config/zsh/volta
source $HOME/.config/zsh/uv
source $HOME/.config/zsh/helm
source $HOME/.config/zsh/kube
source $HOME/.config/zsh/aliases
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/caulotte/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/caulotte/.lmstudio/bin"
# End of LM Studio CLI section

alias new_ticket="git checkout dev && git fetch origin && git pull origin dev && git checkout -b "

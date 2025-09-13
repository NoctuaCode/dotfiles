# Homebrew
source $HOME/.config/zsh/homebrew

case "$TERM" in
    xterm-color|*-256color|xterm-ghostty) color_prompt=yes;;
esac

export LANG=en_US.UTF-8

export EDITOR=nvim

export PATH=$PATH:$HOME/.config/bin
export PATH=$PATH:$HOME/.config/emacs/bin
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

source $HOME/.config/zsh/carapace
source $HOME/.config/zsh/fzf
source $HOME/.config/zsh/zoxide
source $HOME/.config/zsh/shellenv
source $HOME/.config/zsh/functions
source $HOME/.config/zsh/ollama
source $HOME/.config/zsh/postgres
source $HOME/.config/zsh/docker
source $HOME/.config/zsh/starship
source $HOME/.config/zsh/uv
source $HOME/.config/zsh/helm
source $HOME/.config/zsh/kube
source $HOME/.config/zsh/aliases
source $HOME/.config/zsh/mise

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/caulotte/.docker/completions $fpath)
# End of Docker CLI completions

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/caulotte/.lmstudio/bin"
# End of LM Studio CLI section

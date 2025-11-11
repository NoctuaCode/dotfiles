# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew
source $HOME/.config/zsh/homebrew
source /opt/homebrew/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh

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

source $HOME/.config/zsh/mise
source $HOME/.config/zsh/bun
source $HOME/.config/zsh/carapace
source $HOME/.config/zsh/docker
source $HOME/.config/zsh/fzf
source $HOME/.config/zsh/go
source $HOME/.config/zsh/helm
source $HOME/.config/zsh/kube
source $HOME/.config/zsh/postgres
source $HOME/.config/zsh/starship
source $HOME/.config/zsh/uv
source $HOME/.config/zsh/zoxide
source $HOME/.config/zsh/oh-my-zsh
source $HOME/.config/zsh/aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

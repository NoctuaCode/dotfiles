set fish_greeting ""
set -gx TERM xterm-ghostty

set -gx EDITOR nvim

set -g GOPATH $HOME/go
set -g PNPM_HOME $HOME/Library/pnpm
set -g HERD_PATH "$HOME/Library/Application Support/Herd"

set -gx PATH /opt/homberew/bin $PATH
set -gx PATH /opt/homberew/sbin $PATH
set -gx PATH $GOPATH/bin $PATH
set -gx PATH $HOME/.config/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH /opt/homebrew/opt/llvm/bin $PATH
set -gx PATH /opt/homebrew/opt/postgresql@17/bin $PATH
set -gx PATH $PNPM_HOME $PATH
set -gx PATH $HERD_PATH/bin $PATH
set -gx HERD_PHP_84_INI_SCAN_DIR "$HERD_PATH/config/php/84/"

set -gx XDG_CONFIG_HOME $HOME/.config

set -gx OLLAMA_FLASH_ATTENTION true
set -gx OLLAMA_KV_CACHE f16

# use colorls instead of ls
alias ls "eza --icons -F -H --group-directories-first --git"
alias ll "ls -al"
alias lt "ls -T --git-ignore"
alias lta "ls -Ta"

alias c clear
alias vim nvim
alias cat bat

alias bl "brew list"
alias bs "brew search"
alias buu "brew update && brew upgrade"

alias ga "git add -p"
alias gb "git branch"
alias gc "git commit -m"
alias gdiff "git diff"
alias glog "git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gp "git pull --rebase"
alias gP "git push"
alias gs "git status"
alias gS "git switch"

alias django "./manage.py"

fzf --fish | source
zoxide init fish | source
eval $(/opt/homebrew/bin/brew shellenv)

if status is-interactive
    direnv hook fish | source
end

function kill_port
    set pid (lsof -ti :"$argv")
    kill -9 $pid
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

case "$TERM" in
    xterm-color|*-256color|xterm-ghostty) color_prompt=yes;;
esac

export LANG=en_US.UTF-8

export EDITOR=nvim

# Go
export GOPATH=$HOME/go

# Extend PATH
# With local
export PATH=$HOME/.config/bin:$PATH
# With Rust
export PATH=$HOME/.cargo/bin:$PATH
# With Go
export PATH=$(go env GOPATH)/bin:$PATH
# With local bin
export PATH=$HOME/.local/bin:$PATH
# With snap
export PATH=/snap/bin:$PATH
# With nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# use colorls instead of ls
alias ls="eza --icons -F -H --group-directories-first --git"
alias ll="ls -al"
alias lt="ls -T --git-ignore"
alias lta="ls -Ta"

alias c="clear"
alias v="nvim"
alias cat="batcat"

alias ga="git add -p"
alias gb="git branch"
alias gc="git commit -m"
alias gdiff="git diff"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gp="git pull --rebase"
alias gP="git push"
alias gs="git status"
alias gS="git switch"

alias ts="tmux-sessionizer"

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

# Load Angular CLI autocompletion.
source <(ng completion script)

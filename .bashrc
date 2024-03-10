export TERM="xterm-256color"
export EDITOR=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH=$PATH:$HOME/.cargo/bin

set -o vi
[[ $- != *i* ]] && return

alias c=clear
alias la="ls -la"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init bash)"

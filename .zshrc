export PATH=$PATH:$HOME/.cargo/bin
export EDITOR=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias c=clear
alias la="ls -la"

eval "$(starship init zsh)"

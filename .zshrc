export PATH=$PATH:$HOME/.cargo/bin
export TERM='xterm-256color'
export EDITOR=nvim
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias c=clear
alias ls=exa
alias la="ls -la"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

function pacs {
  pacman -Ss $@ | awk '!/^ /' | cut -d '/' -f 2 | cut -d ' ' -f 1 | fzf --preview="echo {} | xargs pacman -Si" | sudo pacman -S
}


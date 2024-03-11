# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH:$(go env GOPATH)/bin

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

bindkey -v

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# bun completions
[ -s "/Users/hunterbarton/.bun/_bun" ] && source "/Users/hunterbarton/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

function brewq {
  brew list | fzf --preview 'brew info {}' --preview-window=right:70%:wrap | xargs brew info
}

function brewrm {
  brew list | fzf --preview 'brew info {}' --preview-window=right:70%:wrap | xargs brew remove
}

function brews {
  { brew formulae; brew casks } | fzf --preview 'brew info {}' --preview-window=right:70%:wrap | xargs brew install
}

function ff {
  fd -t f -H -d 5 -E .git -E node_modules | fzf --preview 'bat --color=always {}' --preview-window=right:70%:wrap --bind '?:toggle-preview' | xargs nvim
}

function ffd {
  fd -t d -H -d 1 -E .git -E node_modules | fzf --preview 'exa -l --color=always {}' --preview-window=right:70%:wrap --bind '?:toggle-preview' | xargs nvim
}

function gbr {
  git for-each-ref --sort=-committerdate refs/remotes/origin --format="%(refname:short)" | fzf --preview "git diff origin/main...{} | bat --color=always" --header "Search Recent Branches" | cut -d"/" -f2- | xargs git checkout
}

alias c=clear
alias ls="exa --icons"
alias la="exa -la --icons"
alias ll="exa -l --icons"
alias n="nvim ."
alias pip="pip3"
alias python="python3"
alias tree="exa --tree"
alias fcd='cd $(fd . -t d --maxdepth 1 | fzf --preview "exa -l --color=always {}")'
alias fp='cd $(fd . ~/Documents/GitHub -t d --maxdepth 1 | fzf --preview "exa -l --color=always {}")'
alias fb='cd $(fd . ~/Documents/GitHub/bonfire -t d --maxdepth 1 | fzf --preview "exa -l --color=always {}")'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

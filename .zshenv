
export NVM_DIR=~/.nvm
source /opt/homebrew/opt/nvm/nvm.sh

source .config/antigen.zsh

antigen use oh-my-zsh
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

antigen bundle git
antigen bundle command-not-found
antigen bundle brew
#antigen bundle common-aliases
#antigen bundle compleat
#antigen bundle git-extras
#antigen bundle git-flow
antigen bundle npm
#antigen bundle pnpm
#antigen bundle osx
#antigen bundle z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
#
#export NVM_LAZY_LOAD=true
#antigen bundle lukechilds/zsh-nvm
#antigen bundle Sparragus/zsh-auto-nvm-use
antigen apply
#
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
#
. "$HOME/.cargo/env"

set -o vi

alias fra="cd  ~/repos/fusion-resource-allocation-apps"
alias org-admin="cd  ~/repos/Project-Portal/frontend/Apps/org-admin"


path+=('/Users/jardar.ton/.local/share/bob/nvim-bin')
path+=('/Users/jardar.ton/.dotnet/tools/')
export PATH



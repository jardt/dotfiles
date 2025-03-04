## Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418

#options 
set -o inc_append_history

type starship_zle-keymap-select >/dev/null || \
  {
    echo "Load starship"
    eval "$(starship init zsh)"
  }

#fzf
source <(fzf --zsh)

#vim stuff
set -o vi
export VISUAL="nvim"
export EDITOR="nvim"
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^y' autosuggest-accept
alias vim="nvim"

#zplug
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-history-substring-search", as:plugin, defer:3
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "Aloxaf/fzf-tab" 

function zvm_config() {
    ZVM_CURSOR_STYLE_ENABLED=false
}
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

zplug "fdellwing/zsh-bat", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/compleat", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/pnpm", from:oh-my-zsh
zplug "plugins/rustup", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh


if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi


# Then, source plugins and add commands to $PATH
zplug load --verbose

# bun completions
[ -s "/Users/jardar.ton/.bun/_bun" ] && source "/Users/jardar.ton/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/jardar.ton/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


## event for sketchybar
function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

#custom
. "$HOME/.cargo/env"


# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

path+=('/Users/jardar.ton/.dotnet/tools/')
export PATH

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

alias ls='ls --color'

eval "$(zoxide init --cmd cd zsh)"


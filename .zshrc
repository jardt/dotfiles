## Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
  {
    echo "Load starship"
    eval "$(starship init zsh)"
  }

#vim stuff
set -o vi
export VISUAL="nvim"
export EDITOR="nvim"
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#zplug
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-history-substring-search", as:plugin, defer:3
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

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

#asdf
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

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



#custom
. "$HOME/.cargo/env"

alias fra="cd  ~/repos/fusion-resource-allocation-apps.git"

path+=('/Users/jardar.ton/.dotnet/tools/')
export PATH


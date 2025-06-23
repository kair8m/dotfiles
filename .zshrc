# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if type brew &>/dev/null
then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    autoload -Uz compinit
    compinit
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit ice lucid nocompile
zinit load MenkeTechnologies/zsh-cargo-completion
zinit light Aloxaf/fzf-tab
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions
zinit ice depth=1; zinit light romkatv/powerlevel10k
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export ZSH_THEME="powerlevel10k/powerlevel10k"

source $HOME/.profile

source $HOME/.config/dotfiles/config.sh
source $HOME/.config/dotfiles/aliases.sh
source $HOME/.config/dotfiles/fdiff.sh
source $HOME/.config/dotfiles/cht.sh
source $HOME/.config/dotfiles/vimfzf.sh
source $HOME/.config/dotfiles/vimr.sh
source $HOME/.config/dotfiles/vims.sh
source $HOME/.config/dotfiles/cdfzf.sh
source $HOME/.config/dotfiles/fzfdir-widget.sh
source $HOME/.config/dotfiles/md-preview.sh
source $HOME/.config/dotfiles/help.sh
source $HOME/.config/dotfiles/killproc.sh

if hash zoxide 2>/dev/null; then
    eval "$(zoxide init zsh)"
fi

if hash gh 2>/dev/null; then
    eval "$(gh completion -s zsh)"
fi


if hash brew 2>/dev/null; then
    source $(brew --prefix nvm)/nvm.sh
fi

if hash bob 2>/dev/null; then
    eval "$(bob complete zsh)"
fi

if hash gh 2>/dev/null; then
    eval "$(gh completion -s zsh)"
fi

export NVM_DIR=~/.nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Set up fzf key bindings and fuzzy completion
if hash fzf 2>/dev/null; then
    source <(fzf --zsh)
fi
# eval "$(op completion zsh)"
# kitty
bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
bindkey -v
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-fzf-history-search
    web-search
    fd
)
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

source $HOME/.profile

source $HOME/.config/dotfiles/config.sh
source $HOME/.config/dotfiles/aliases.sh
source $HOME/.config/dotfiles/fdiff.sh
source $HOME/.config/dotfiles/cht.sh
source $HOME/.config/dotfiles/vimfzf.sh
source $HOME/.config/dotfiles/cdfzf.sh
source $HOME/.config/dotfiles/md-preview.sh
source $HOME/.config/dotfiles/help.sh

if hash zoxide 2>/dev/null; then
    eval "$(zoxide init zsh)"
fi

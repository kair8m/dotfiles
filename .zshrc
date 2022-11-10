export ZSH="$HOME/.oh-my-zsh"
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-fzf-history-search
    web-search
)
source $ZSH/oh-my-zsh.sh

ZSH_THEME="powerlevel10k/powerlevel10k"
source $HOME/.profile

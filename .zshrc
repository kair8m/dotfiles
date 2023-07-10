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
    fzf
)
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f $ZSH/oh-my-zsh.sh ]] || source $ZSH/oh-my-zsh.sh

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

export NVM_DIR=~/.nvm
if hash brew 2>/dev/null; then
    source $(brew --prefix nvm)/nvm.sh
fi
ulimit -n 200000
ulimit -u 2048

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


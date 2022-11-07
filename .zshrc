if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.profile

export ZSH="$HOME/.oh-my-zsh"
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-fzf-history-search
	web-search
)

export EDITOR=nvim
alias py=python
alias sc"=source ~/.zshrc"
alias top=vtop
alias htop=vtop
alias rm=trash
alias vim=nvim
alias edit=$EDITOR
alias untar="tar -xvf"
alias flashmate="java -jar $HOME/EDF/flashmate.jar"
alias pack="tar -czvf"
alias cat=bat
alias lg=lazygit

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_PREVIEW_PREVIEW_BAT_THEME="Dracula"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="fd --type f"
export FZF_ALT_C_COMMAND="fd --type f"

#bat cli setup 

function md-preview {
  pandoc "$1" | lynx -stdin
}

function fdiff {
  preview="git diff -- {-1} | delta --file-style=omit --width=${FZF_PREVIEW_COLUMNS:-$COLUMNS}"
  proj_root=$(git rev-parse --show-toplevel 2> /dev/null)
  cd $proj_root
  git diff $@ --name-only | fzf -m --ansi --preview $preview
  cd -
}

function vimfzf {
  proj_root=$(git rev-parse --show-toplevel 2> /dev/null)
  cd $proj_root
  nvim $(fzf --preview "bat --color=always --style=numbers {-1}")
  cd -
}

alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

echo "set completion-ignore-case On" >> $HOME/.inputrc
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ${HOME}/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /etc/zsh_command_not_found
export PYTHONSTARTUP=${HOME}/.pythonrc
-e 
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

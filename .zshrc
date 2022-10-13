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
	auto-notify
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

source $ZSH/oh-my-zsh.sh

if [[ $OSTYPE == 'darwin'* ]]; then
	# remap '~' key
	hidutil property --set 	'{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064},{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035}]}' > /dev/null
	alias cat=bat
	BATCOMMAND=bat
fi
if [[ $OSTYPE == 'linux'* ]]; then
	alias cat=batcat
	BATCOMMAND=batcat
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion /usr/local/opt/python@3.10/bin/python3.10 -m pip
# pip zsh completion end

function md-preview {
  pandoc "$1" | lynx -stdin
}

function fd {
  proj_root=$(git rev-parse --show-toplevel 2> /dev/null)
  preview="git diff $@ --color=always -- {-1}"
  cd $proj_root
  git diff $@ --name-only | fzf -m --ansi --preview $preview
  cd -
}

ESRLABS_LICENSE_FILE=27000@flexnet-license-server.int.esrlabs.com
echo "set completion-ignore-case On" >> $HOME/.inputrc
source ~/powerlevel10k/powerlevel10k.zsh-theme
export AUTO_NOTIFY_THRESHOLD=20
export AUTO_NOTIFY_TITLE="Hey! %command has just finished"
export AUTO_NOTIFY_BODY="It completed in %elapsed seconds with exit code %exit_code"
AUTO_NOTIFY_IGNORE+=("nvim", "vim", "htop", "vtop", "cat", "bat", "git", "ssh", "ptpython", "python", "node", "tail", "fd")

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ${HOME}/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/doc/fzf/examples/key-bindings.zsh
export PYTHONSTARTUP=${HOME}/.pythonrc
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


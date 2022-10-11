#!/bin/sh

if [[ $OSTYPE != 'linux'* ]]; then
	echo "This script is supposed to run on linux machine!"
	exit
fi

# update package manager list and upgrade outdated packages
sudo apt-get update -yy && sudo apt-get upgrade -yy

# install tools
sudo apt-get install -yy \
	git \
	cmake \
	tree \
	net-tools \
	htop \
	python3 \
	python3-ip \
	nodejs \
	npm \
	docker.io \
	docker-compose \
	vim \
	neovim \
	fzf \
	zsh \
	fish \
	bat \
	curl \
	wget \
	trash-cli \
	ripgrep \
	zsh-autosuggestions \
	zsh-syntax-highlighting \
	terminator \
	powerline \
	fonts-powerline

sudo snap install chromium code

sudo npm install -g vtop
pip install pandoc

# docker setup
touch ${HOME}/.docker_history
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 


# vim setup
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
touch ${HOME}/.vimrc
mkdir -p ${HOME}/.config/nvim
ln -s ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim
curl "https://raw.githubusercontent.com/kair8m/dotfiles/main/.vimrc" >> ${HOME}/.vimrc
git clone https://github.com/Yggdroot/indentLine.git ${HOME}/.vim/pack/vendor/start/indentLine
vim -u NONE -c "helptags  ${HOME}/.vim/pack/vendor/start/indentLine/doc" -c "q"


#oh-my-zsh setup
mkdir -p ${HOME}/.oh-my-zsh/custom
curl "https://raw.githubusercontent.com/kair8m/dotfiles/main/.zshrc" >> ${HOME}/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${HOME}/powerlevel10k && echo 'source ${HOME}/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
git clone https://github.com/MichaelAquilina/zsh-auto-notify.git $ZSH_CUSTOM/plugins/auto-notify
git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf
${HOME}/.fzf/install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

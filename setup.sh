#! /bin/bash

OMZ=~/.oh-my-zsh
TMP=~/.tmux/plugins

# get zsh
if ! [ -x "$(command -v zsh)" ]; then
	sudo apt install zsh
	chsh -s $(which zsh) 
    echo ">>> installed zsh <<<"
else
    echo "=== zsh already installed ==="
fi 


# get tmux
if ! [ -x "$(command -v tmux)" ]; then
	sudo apt install tmux 
    echo ">>> installed tmux <<<"
else
    echo "=== tmux already installed ==="
fi 

# get curl
if ! [ -x "$(command -v curl)" ]; then
	sudo apt install curl 
    echo ">>> installed curl <<<"
else
    echo "=== curl already installed ==="
fi 

# install nodejs for coc.nvim
#curl -sL install-node.now.sh/lts | bash
if ! [ -x "$(command -v nodejs)" ]; then
    sudo apt-get install -y nodejs
    echo ">>> installed nodejs <<<"
else 
    echo "=== nodejs already installed ==="
fi 

if ! [ -x "$(command -v nvim)" ]; then
    sudo apt install neovim 
    echo ">>> installed neovim"
else 
    echo "=== neovim already installed ==="
fi

# get oh-my-zsh
if [ ! -d "$OMZ" ]; then
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    echo ">>> installed oh-my-zsh <<<"
fi

# get tpm
if [ ! -d "$TMP/tpm" ]; then
	git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
fi 

# deploy configs
echo ">>> setting zsh configs"
cp ./keitoku.zsh-theme $OMZ/themes/keitoku.zsh-theme

cp ./zshrc ~/.zshrc
zsh ~/.zshrc

echo ">>> setting tmux configs"
tic ./utils/xterm-256color-italic.terminfo 
cp ./tmux.conf ~/.tmux.conf 

echo ">>> setting vim configs"
cp ./vimrc ~/.vimrc
cp ./init.vim ~/.config/nvim/init.vim 

# Vim plug       
if [ -f "~/.vim/autoload/plug.vim " ]; then 
    echo ">>> installing vim-plug "
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi 

# vim colorscheme
mkdir -p ~/.vim/colors/ 
mkdir -p ~/.config/nvim/colors
cp ./vim-keitoku.vim ~/.vim/colors/ 
cp ./vim-keitoku.vim ~/.config/nvim/colors/

#sudo snap install universal-ctags

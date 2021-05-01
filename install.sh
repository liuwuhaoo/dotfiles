#!/bin/sh

INSTALL_COMMAND=""
OS="`uname`"

if [ $OS == "Linux" ]
then
    echo "Linux"
    INSTALL_COMMAND="sudo apt-get install"
elif [ $OS == "Darwin" ]
then
    echo "Mac OS"
    INSTALL_COMMAND="brew install"
else
    echo "no support"
fi

# vim
# install
vim --version || {
    echo -e "Vim Installing\n"
    command="$INSTALL_COMMAND vim"
    $command
    echo -e "Vim Installed\n"
}

echo -e "Vim-plug Installing" || curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || echo -e "Vim-plug Installed"

echo -e "Vimrc Linking\n"
ln -s $PWD/.vimrc ~/.vimrc
echo -e "Vimrc Linked\n"

# zsh
# install
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# link zsh


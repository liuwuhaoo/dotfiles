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
    command = "$INSTALL_COMMAND vim"
    $command
}

ln -s $PWD/.vimrc /tmp/.vimrc
echo "vim done\n"

# zsh
# install
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# link zsh


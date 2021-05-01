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
    echo "Vim Installing\n"
    command="$INSTALL_COMMAND vim"
    $command
    echo "Vim Installed\n"
}

echo "Vimrc linking\n"
ln -s $PWD/.vimrc /tmp/.vimrc
echo "Vimrc linked\n"

# zsh
# install
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# link zsh


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

function tip() {
    if ($2)
    then
        echo -e "$1 Installing.\n"
    else
        echo -e "$1 Installed.\n"
    fi
}

function install() {
    tip $1 true
    command="$INSTALL_COMMAND $1"
    $command
    tip $1
}

# curl
curl --version || {
    install curl
}

# vim
# install
vim --version || {
    install vim
}

ls -l ~/.vim/autoload || {
    tip vim-plug true
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    tip vim-plug
}

ls -l ~/.vimrc || {
    tip vimrc true
    ln -s $PWD/.vimrc ~/.vimrc
    tip vimrc
}

# zsh
# install
zsh --version || {
    install zsh
}
# link zsh
ls -l ~/.zshrc || {
    tip zshrc true
    ln -s $PWD/.zshrc ~/.zshrc
    tip zshrc
}


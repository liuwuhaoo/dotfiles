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
    tip $1 false
}

function check_version_install() {
    $1 --version || install $1 
}

# curl
check_version_install curl

#wget
check_version_install wget

# vim
check_version_install vim

ls -l ~/.vim/autoload || {
    tip vim-plug true
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    tip vim-plug false
}

ls -l ~/.vimrc || {
    tip vimrc true
    ln -s $PWD/.vimrc ~/.vimrc
    tip vimrc false
}

#alacritty
install alacritty

#alacritty configuration
if [ -d ~/.config/alacritty ];
then
    echo "Alacritty Configuration Installed."
else
    tip alacritty_configuration true
    ln -s $PWD/.config/alacritty ~/.config/alacritty
    tip alacritty_configuration false
fi

# lf
echo "Install lf manually: https://github.com/gokcehan/lf/releases"

#lf configuration
if [ -d ~/.config/lf ];
then
    echo "Lf Configuration Installed."
else
    tip lf_configuration true
    ln -s $PWD/.config/lf ~/.config/lf
    tip lf_configuration false
fi

# neofetch
check_version_install neofetch

# tmux
install tmux

#tmux configuration
if [ -f ~/.tmux.conf ];
then
    echo "tmux.conf Installed."
else
    tip tmux_conf true
    ln -s $PWD/.tmux.conf ~/.tmux.conf
    tip tmux_conf false
fi

# zsh
check_version_install zsh

# .oh-my-zsh
ls -l ~/.oh-my-zsh || {
    sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# auto-jump
check_version_install autojump

# zsh-syntax-highlighting
if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting];
then
    echo "zsh-syntax-highlighting Installed"
else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# zsh-autosuggestions
if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions];
then
    echo "zsh-autosuggestions Installed"
else
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# link zsh
rm ~/.zshrc
ls -l ~/.zshrc || {
    tip zshrc true
    ln -s $PWD/.zshrc ~/.zshrc
    tip zshrc false
}

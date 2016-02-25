#!/bin/bash

ln -s ~/dotfiles/zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ~/dotfiles/agnoster-light.zsh-theme ~/.oh-my-zsh/themes/agnoster-light.zsh-theme

ln -s ~/dotfiles/vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall



#!/usr/bin/bash

system_prefix=apt-get

$system_prefix install git

git clone https://github.com/XingangShi/vim_installer.git && cd vim_installer && bash setup.sh && cd -

$system_prefix install zsh
zsh --version
# 设置当前 默认 shell 为 zsh
#$ echo $SHELL    //把zsh设为默认shell，如果shell列表中没有zsh或者你没有使用chsh权限的时候，不起作用
#
#$ [sudo] chsh -s $(which zsh) 或，
#$ chsh -s /bin/zsh

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# add Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):
# plugins=(zsh-autosuggestions)

$system_prefix install autojump
autojump --version
# add Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):
# plugins=(autojump)

# my oh-my-zsh plugins
#
#plugins=(git
#         zsh-autosuggestions
#         autojump
#         zsh-syntax-highlighting
#)

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

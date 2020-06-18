#!/usr/bin/bash


system_prefix='apt-get'
args='-y install'


$system_prefix update

$system_prefix $args net-tools
$system_prefix $args wget

$system_prefix $args openssh-server openssh-client

$system_prefix $args vim
$system_prefix $args vim-gtk

$system_prefix $args git

$system_prefix $args subversion


$system_prefix $args zsh
$system_prefix $args autojump

$system_prefix $args mycli


echo $SHELL
sudo chsh -s $(which zsh)
echo $SHELL

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
compaudit | xargs chmod g-w,o-w

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# update my oh-my-zsh plugins
# vim ~/.zshrc 修改
#plugins=(git
#         zsh-autosuggestions
#         autojump
#         zsh-syntax-highlighting
#)

$system_prefix $args python3 python3-dev

$system_prefix $args nodejs nmp

$system_prefix $args cmake

git clone https://github.com/XingangShi/vim_installer.git ~/.vim_installer && cd ~/.vim_installer && bash setup.sh && cd -


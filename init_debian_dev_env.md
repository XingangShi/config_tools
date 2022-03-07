## 初始化 `Debian` 开发环境

### 更新 debian 源，更新系统


#### 升级到 debian 10


```shell
sudo vi /etc/apt/sources.list

修改内容为
"""
deb http://mirrors.163.com/debian/ buster main non-free contrib
deb http://mirrors.163.com/debian/ buster-updates main non-free contrib
deb http://mirrors.163.com/debian/ buster-backports main non-free contrib
deb http://mirrors.163.com/debian-security/ buster/updates main non-free contrib

deb-src http://mirrors.163.com/debian/ buster main non-free contrib
deb-src http://mirrors.163.com/debian/ buster-updates main non-free contrib
deb-src http://mirrors.163.com/debian/ buster-backports main non-free contrib
deb-src http://mirrors.163.com/debian-security/ buster/updates main non-free contrib
"""

sudo apt update && sudo apt upgrade -y
```

#### 升级到 debian 11
```shell
sudo vi /etc/apt/sources.list

修改内容为
"""
deb http://mirrors.163.com/debian/ bullseye main non-free contrib
deb-src http://mirrors.163.com/debian/ bullseye main non-free contrib
deb http://mirrors.163.com/debian-security/ bullseye-security main
deb-src http://mirrors.163.com/debian-security/ bullseye-security main
deb http://mirrors.163.com/debian/ bullseye-updates main non-free contrib
deb-src http://mirrors.163.com/debian/ bullseye-updates main non-free contrib
deb http://mirrors.163.com/debian/ bullseye-backports main non-free contrib
deb-src http://mirrors.163.com/debian/ bullseye-backports main non-free contrib
"""

sudo apt update && sudo apt upgrade -y
```

### 基础软件安装

```shell
# base
sudo apt install -y git cmake python3-dev python2-dev wget curl

# install language
sudo apt install -y python2 python3 golang g++ gcc rustc nodejs npm default-jdk

```

### 安装 `vim`

```shell
sudo apt install vim-gtk3 -y
sudo apt install vim -y
vim --version

sudo git clone https://github.com/XingangShi/vim_installer.git && cd vim_installer && bash setup.sh && cd - && sudo rm -rf vim_installer

cd ~/.vim/bundle/YouCompleteMe

/usr/bin/python3 /home/panshi/.vim/bundle/YouCompleteMe/third_party/ycmd/build.py --all --verbose
```

### 安装 `zsh`

```shell
sudo apt install -y zsh
zsh --version


git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
apt install autojump
autojump --version



echo $SHELL
sudo chsh -s $(which zsh)
echo $SHELL

修改 ~/.zshrc

"""
plugins=(git
         zsh-autosuggestions
         autojump
         zsh-syntax-highlighting
)
"""

重启生效

echo $SHELL
```

### 安装 `emacs`

```shell
sudo apt install -y emacs
git clone https://github.com/xingangshi/emacs_evil.git
cd emacs_evil
bash install_prelude_emacs.sh
cd ..
emacs
Ctrl-x Ctrl-c
M-x package-install RET monokai-theme RET
Ctrl-x Ctrl-c
```

## 初始化 `Debian` 开发环境

### [wsl 安装](https://docs.microsoft.com/zh-cn/windows/wsl/install) Debian

#### wsl 常用命令

1. 开启虚拟机支持：

要在 Windows 10（1903，1909） 上启用虚拟机平台，请以管理员身份打开 PowerShell 并运行：

```bash
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

2. 设置默认开启 WSL2： `wsl --set-default-version 2`, 设置具体的子系统为 wsl2 版本： `wsl --set-version <Distro> 2`。

3. 查看可安装子系统列表： `wsl --list --online`，安装子系统：`wsl --install -d <DistroName>`，默认安装到 C 盘。

4. 查看本机已安装子系统： `wsl --list` 或 `wsl --list --verbose`。

5. 卸载子系统：`wsl --unregister Debian`。

### 安装子系统到非 C 盘

（以 Debian 为例，下载文件为：`TheDebianProject.DebianGNULinux_1.12.1.0.AppxBundle`）

1. 选择合适的 wsl 发行版本 [Linux distributions](https://docs.microsoft.com/en-us/windows/wsl/install-manual#downloading-distributions)

2. 重命名文件为 `.zip`, 并解压到目标目录，找到对应系统的安装包 `DistroLauncher-Appx_1.12.1.0_x64.appx`，重命名 `.zip`，并解压。

3. 以管理员权限运行 `debian.exe`，会安装到当前目录下，会产生一个 `ext4.vhdx` 的文件。

4. 在 `windows terminal` 中配置 Debian 启动路径：“设置 --> 配置文件 --> Debian --> 命令行：`E:\wsl2\debian\debian.exe`”。

4. 登录 Debian 设置 root 密码：`sudo passwd root`。

5. PowerShell 设置登录默认用户名：`debian config --default-user panshi`。

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
sudo apt install -y git cmake python3-dev python2-dev wget curl build-essential

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

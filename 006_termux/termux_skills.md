### [Termux](https://termux.com/) 汇总

---
> 记录自己使用 termux 的一些技巧和命令，主要是针对 手机端的。


#### 基本命令
> Termux 除了支持 `apt`  命令外，还可以使用在 `apt` 基础上封装的 `pkg` 命令
``` bash
pkg search <query>       # 搜索包
pkg install <package>    # 安装包
pkg uninstall <package>  # 卸载包
pkg reinstall <package>  # 重新安装包
pkg update               # 更新源
pkg upgrade              # 升级软件包
pkg list-all             # 列出可供安装的所有包
pkg list-installed       # 列出已经安装的包
pkg show <package>       # 显示某个包的详细信息
pkg files <package>      # 显示某个包的相关文件夹路径
```
> ××注意**：`pkg install` 每次使用时会主动调用一次 `apt update`，建议使用 `pkg` 命令。

#### 超级管理员

##### 1. `termux-chroot` 命令（伪 root 权限）
> 安装：`pkg install proot -y` （**没有 root 的手机使用**）
>
> 使用：`termux-chroot`

##### 2. `tsu` 命令（已 root，termux 替换 `su` 命令）
> 安装：`pkg install tsu -y` （**已 root 的手机使用**）
>
> 使用：`tsu`

#### 架设 Server

#####  1. 通过 Node.js 运行 HTTP Server
> 安装：`npm install -g http-server`
>
> 使用：`http-server`

##### 2. 通过 python  运行 HTTP Server
> 安装：`pkg install python`
>
> 使用：`python -m http.server 8080`

##### 访问
> 浏览器打开 `http://127.0.0.1:8080`

## 个人配置及工具汇总

一些常用的配置、工具，主要涉及到 linux、macos，也包括一些有用的素材和信息。

---

### [工作总结](https://github.com/sxgic/lastdays)

### 自己用过的命令行的集锦

> 自己用过的命令行的集锦，温故知新。
>
> 如题，详情见：[awesome_commnd_tips.md](/awesome_commnd_tips.md)

### 0. 杂项

#### 0.1 [Termux 技巧汇总](/006_termux/termux_skills.md)

#### 0.2 [Debian 系统升级 7 - 10](/001_linux/debian_update.md)

#### 0.3 [视频压缩命令行](https://tools.rotato.app/compress)

命令行版本

```
$ ffmpeg -i input.mp4 -vcodec h264 -acodec mp2 output.mp4
$ ffmpeg -i input.mp4 -c:v libx264 -tag:v avc1 -movflags faststart -crf 30 -preset superfast output.mp4
```

#### 0.4 [Beancount](https://github.com/beancount/beancount) 中文账户时报错

Beancount 可以设置账户类型为中文，比如：
`1900-01-01 open 资产:银行卡:招商银行       CNY  ; 招商银行`
但是，使用时，会提示账户错误信息 `Invalid account name: 资产:银行卡:招商银行`


可以通过修改以下代码解决，以 `macOS` 为例子
打开文件 `/Library/Frameworks/Python.framework/Versions/3.12/lib/python3.12/site-packages/beancount/parser/grammar.py`

``` python
修改函数 account，屏蔽掉账户类型报错信息

def account(self, filename, lineno, account):
    """Check account name validity.
    Args:
      account: a str, the account name.
    Returns:
      A string, the account name.
    """

    # start 屏蔽使用中文账户时，会提示错误：账户信息错误提示
    #if not self.account_regexp.match(account):
    #    meta = new_metadata(filename, lineno)
    #    self.errors.append(
    #        ParserError(meta, "Invalid account name: {}".format(account), None)
    #    )
    #end 屏蔽使用中文账户时，会提示错误：账户信息错误提示

    # Intern account names. This should reduces memory usage a
    # fair bit because these strings are repeated liberally.
    return self.accounts.setdefault(account, account)
```

[相关在线工具](https://s.900820.xyz/spys)，[完整链接](https://tools.rotato.app/compress)。

### 1. Linux

> 记录 Linux 相关的工具和配置。

#### 1.1 博客自动发布备份更新脚本

> 博客通过 hexo 来更新，同时发布到两个 git 的仓库（Github 和 git.dev.tencent.com），互相备份。
>
> 如题，详情见：[blog_auto_release.sh](/001_linux/blog_auto_release.sh)

#### 1.2 Shell 颜色输出大全

> Shell 不止是黑白分明，也可以多姿多彩。
>
> 如题，详情见：[output_color_syntax.sh](/001_linux/output_color_syntax.sh)

#### 1.3 检查一些软件是否安装

> 检查系统是否安装一些软件。
>
> 如题，详情见：[system_check_env.sh](/001_linux/system_check_env.sh)

#### 1.4 Centos 安装 GCC

> 安装 GCC，本次版本为 `gcc 9.2.0`
>
> 如题，详情见：[install_gcc.sh](/001_linux/install_gcc.sh)

#### 1.5 tmux 配置文件一份
>
> 如题，详情见：[tmux.conf](/001_linux/tmux.conf)

#### 1.6 `zsh : command not found pip3` 的解决方案

```bash
sudo apt-get install --reinstall python3-pip
pip3 -V
pip3 install --upgrade pip
pip --version
```

#### 1.7 [Mycli](https://github.com/dbcli/mycli) 使用时报错 `The 'prompt_toolkit<3.0.0,>=2.0.6' distribution was not`

```bash
pip3 install 'prompt-toolkit==2.0.8'
```

##### 1.8 Linux 命令 find 参数 atime、ctime、mtime 解释

```bash
# find  -[atime|ctime|mtime] [n|+n|-n]
#
# atime 是指 access time，文件被读取或者执行的时间，修改文件是不会改变 access time 的。
# ctime 是指 change time，文件状态改变时间，指文件的 i 结点被修改的时间，如通过 chmod 修改文件属性，ctime 就会被修改。
# mtime 是指 modify time，指文件内容被修改的时间。
#
# find . –ctime n  #最后一次修改发生在距离当前时间 n*24 小时至 (n+1)*24 小时
# find . –ctime +n #最后一次修改发生在 n+1 天以前，距离当前时间为 (n+1)*24 小时或者更早
# find . –ctime –n #最后一次修改发生在 n 天以内，距离当前时间为 n*24 小时以内
if [[ -d "./backup_log" ]]; then
    # 删除 30 天以前的 备份日志
    find ./backup_log -maxdepth 1 -type d -ctime +30 -exec rm -rf {} \;
fi
```

### 2. MacOs

> 记录 MacOs 相关的工具和配置。

#### 2.1 [spacemacs](http://spacemacs.org/)（[Emacs](https://www.gnu.org/software/emacs/)） 的 evil 模式配置

>> 如题，详情见：[spacemacs](/002_macos/spacemacs)

### 3. Windows

> 记录 Windows 相关的工具和配置。

#### 3.1 Windows 下清理 C 盘垃圾的小工具

> 如题，详情见：[./003_windows/clear_rubbish.bat](/003_windows/clear_rubbish.bat)。

#### 3.2 查找文件工具 Everything

> 如题，windows 下快速查找本地文件的工具，[Everything_1.4.1.877](/003_windows/exe/Everything_1.4.1.877_x64-Setup.exe)

#### 3.3 Windows 下针对 FC660M 使用 [AutoHotkey](https://www.autohotkey.com/) 改建成 HHKB 模式的脚本

> 工欲善其事必先利其器，普通键盘的 Ctrl 键经常会按的小拇指疼，但是又碍于 HHKB 的高昂价格，所以自己虚拟该键，拯救小拇指。
>
> 如题，详情见：[./003_windows/fc660m-to-hhkb_mode-v1.1.ahk](/003_windows/fc660m-to-hhkb_mode-v1.1.ahk)
>
> 附：
>
>> 1. [FC660M](https://item.jd.com/20713051876.html)
>>
>> 2. [HHKB](https://item.jd.com/28296484594.html)

#### 3.4 Python 启动一个简单本地服务器

> 有时候，我们想在局域网里给朋友或同事传文件，微信有大小限制，用 QQ 当然也可以的，这里提供一个本地服务器的分享方式。
>
> 详情见，[Python 启动一个简单本地服务器](/003_windows/python_local_server/Python_local_server.md)

#### 3.5 增加一个 Xshell 的配色方案

> 一个 [Xshell](https://xshell.en.softonic.com/) 的配色方案。
>
> 使用方法： 工具 --》 配色方案 --》 导入
>
> 配色方案详情：[xshell_colors_on_black](/003_windows/xshell_colors_on_black.xcs)

#### 3.6 Sublime_Text_3 相关

> 增加个人 Sublime_Text_3 配置
>>
>> [Preferences.sublime-settings](/003_windows/Preferences.sublime-settings)
>
> Sublime Text 3： [Decode error - output not utf-8]
>
>> 在系统变量加入 `PYTHONIOENCODING`，值填写：`utf-8`。

#### 3.7 Win10、linux SCP 拷贝文件

**需要注意 windows 下的文件路径 `/d:/`**
> 从 linux 系统复制文件到 windows 系统：

```bash
scp /oracle/a.txt  administrator@192.168.3.181:/d:/
```

> 在 linux 环境下，将 windows 下的文件复制到 linux 系统中：

```bash
scp administrator@192.168.3.181:/d:/test/config.ips  /oracle
```

#### 3.8 git status 显示中文和解决中文乱码

**原因：在默认设置下，中文文件名在工作区状态输出，中文名不能正确显示，而是显示为八进制的字符编码。**

```bash
git config --global core.quotepath false
```

#### 3.9 解决 Windows 文件在 WSL 最高权限

> 问题描述：在遇到 WSL 在 Windows 环境中拥有 777 最高权限，想通过`chmod 600 file_path` 修改权限时，修改无效。
>
> 解决办法：卸载文件所在挂载盘并以 `drvfs` 文件系统 `metadata` 标志重新挂在一次即可，操作如下：

```bash
sudo umount /mnt/e
sudo mount -t drvfs E: /mnt/e -o metadata
sudo chmod 600 /mnt/e/file_path
```

### 4. 迁移博客中的第三方图床的图片到本地化

> 由于之前使用的两个图床 ： [Imgur](https://i.imgur.com)（国内访问不稳定） 和 新浪图床（不允许第三方平台调用），所以打算把博客两个图床的图片全部爬下来，迁移到 github。
>
> 详情见目录： [004_localizating_the_pics_of_blog_post](/004_localizating_the_pics_of_blog_post)。

### 5. 使用 reveal-md 来做 md 文件的 PPT 展示

> 一个 [Markdown](https://www.geekpanshi.com/archives/e0c74487.html) 的中重度患者，在被要求做一个 PPT 的演讲时，毅然决然的走向了基于 MARKDOWN 的 PPT 展示探索，很幸运的是已经有了成熟的方案 [reveal-md](https://github.com/webpro/reveal-md)
>
> 请见请链接：[005_reveal-md-for_md_ppt_show](/005_reveal-md-for_md_ppt_show)。

### 6. 字体

[等宽字体测试文本](https://raw.githubusercontent.com/xingangshi/config_tools/master/等宽字体测试.txt)

#### 6.1 等宽字体 - Sarasa Gothic

[Sarasa Gothic / 更纱黑体 / 更紗黑體 / 更紗ゴシック / 사라사 고딕](https://github.com/be5invis/Sarasa-Gothic) 字体下载。

[标准字体下载链接](https://raw.githubusercontent.com/xingangshi/config_tools/master/others/sarasa-mono-sc-regular.ttf)

[vscode](https://code.visualstudio.com/) 设置 `'Sarasa Mono SC' 14` 或 `'等距更纱黑体 SC' 14`。

#### 6.2 等宽字体 - Noto CJK fonts

Google 与 Adobe 共同推出的 Noto Serif CJK 字体：[Noto CJK fonts](https://github.com/googlefonts/noto-cjk) 字体下载。

[vscode](https://code.visualstudio.com/) 设置 `'Noto Serif CJK SC' 14`。

#### 6.3 等宽字体 - Unifont

GNU Unifont is part of the GNU Project. ：[GNU Unifont](https://unifoundry.com/unifont/) 字体下载。

[标准字体下载链接](https://raw.githubusercontent.com/xingangshi/config_tools/master/others/unifont-14.0.02.ttf)

[vscode](https://code.visualstudio.com/) 设置 `'Unifont' 14`。

### 7. 命令行登录水木社区

命令行直接使用 `ssh m_username@bbs.mysmth.net` 登陆后，乱码，因为 水木社区的编码是 `gbk`，可以使用 `luit` 命令进行转码后就可以：

```
luit -encoding gbk sshpass -p m_password ssh m_username@bbs.mysmth.net
```

也可以使用 `iTerm2` 设置终端编码
```
1. preferences -> profiles -> +(创建一个，比如起名为 gbk-prof) -> terminal -> terminal emulation -> character encoding 配置为 gbk

2. Profiles -> <刚创建的profile,如 gbk-prof> 打开一个使用对应 profile 的窗口, 执行对应命令(telnet)
```

### N. [Gists 备份](https://gist.github.com/xingangshi)

#### n.1 [python3 installer](/000_gists_bak/python3_install.sh)

#### n.2 [cmake get os info](/000_gists_bak/cmake_get_os_info.cmake)

#### n.3 [cron snapshots](/000_gists_bak/cron_info.txt)

#### n.4 [nodejs req vs resp with error info](/000_gists_bak/nodejs_req_vs_res.js)

#### n.5 [vim installer](/000_gists_bak/vim_install.sh)

#### n.6 [pypy vs py2 vs py3](/000_gists_bak/pypy_vs_py2_vs_py3)

> [test_pypy.py](/000_gists_bak/pypy_vs_py2_vs_py3/test_pypy.py)
>
> [run_test.sh](/000_gists_bak/pypy_vs_py2_vs_py3/run_test.sh)

#### n.7 [xcode vim plugin installer](/000_gists_bak/xvim2_installer.sh)

#### n.8 [a simple dict installer](/000_gists_bak/abc_dict_install.sh)

> [A simple one hundred thousand dict install for using by local](/000_gists_bak/abc_dict_install.sh)

#### n.9 [delete all weibo](/000_gists_bak/delete_weibo_poster.js)

> [delete all weibo you post](/000_gists_bak/delete_weibo_poster.js)

#### n.10 [termux android keyboard](/000_gists_bak/termux.properties)

> [termux for andriod keyboard setting](/000_gists_bak/termux.properties)

#### n.11 [generate a qdcode by terminal](/000_gists_bak/generate_qrenco.sh)

> [genarete a qrcode for every things](/000_gists_bak/generate_qrenco.sh)

#### n.12 [terminal python print color](/000_gists_bak/colorprint.py)

> [a new print function for python to print color in terminal](/000_gists_bak/colorprint.py)

#### n.13 [Env for oh-my-zsh](/000_gists_bak/init_oh-my-zsh.sh)

> [init my self oh-my-zsh for debian](/000_gists_bak/init_oh-my-zsh.sh)

#### n.14 [Generate post api args](/000_gists_bak/geneate_post_args.py)

> [generate all args for post api using hmac and md5](/000_gists_bak/geneate_post_args.py)

#### n.15 [获取微博热搜及筛选](/000_gists_bak/get_weibo_tops.sh)

> [获取新浪微博热搜并筛选自己感兴趣的话题](/000_gists_bak/get_weibo_tops.sh)

#### n.16 [Installer for googler](/000_gists_bak/install_googler.sh)

> [googler installer](/000_gists_bak/install_googler.sh)

#### n.17 [Get all server tables of dbs which more bigger](/000_gists_bak/get_db_tables_info.sql)

> [Get all server tables of dbs which more bigger](/000_gists_bak/get_db_tables_info.sql)

#### n.18 [Merlin's Wisdom Project (Draft)](/000_gists_bak/merlin-wisdom_project/wisdom.md)

> [Merlin's Wisdom Project (Draft)](/000_gists_bak/merlin-wisdom_project/wisdom.md)

#### n.19 [如何删除 git 历史中的大文件或敏感信息](/000_gists_bak/delete_large_file_in_git_histotry.md)

> [如何删除 git 历史中的大文件或敏感信息](/000_gists_bak/delete_large_file_in_git_histotry.md)

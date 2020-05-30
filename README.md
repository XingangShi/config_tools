## config_tools
一些常用的配置、工具，主要涉及到 linux、macos，也包括一些有用的素材和信息。

---

### 自己用过的命令行的集锦
> 自己用过的命令行的集锦，温故知新。
>
> 如题，详情见：[awesome_commnd_tips.md](/awesome_commnd_tips.md)

### 0. 杂项
#### 0.1 [Termux 技巧汇总](/006_termux/termux_skills.md)

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
>> 1. [FC660M](https://item.jd.com/20713051876.html)
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

### 4. 迁移博客中的第三方图床的图片到本地化
> 由于之前使用的两个图床 ： [Imgur](https://i.imgur.com)（国内访问不稳定） 和 新浪图床（不允许第三方平台调用），所以打算把博客两个图床的图片全部爬下来，迁移到 github。
>
> 详情见目录： [004_localizating_the_pics_of_blog_post](/004_localizating_the_pics_of_blog_post)。

### 5. 使用 reveal-md 来做 md 文件的 PPT 展示
> 一个 [Markdown](https://www.geekpanshi.com/archives/e0c74487.html) 的中重度患者，在被要求做一个 PPT 的演讲时，毅然决然的走向了基于 MARKDOWN 的 PPT 展示探索，很幸运的是已经有了成熟的方案 [reveal-md](https://github.com/webpro/reveal-md)
>
> 请见请链接：[005_reveal-md-for_md_ppt_show](/005_reveal-md-for_md_ppt_show)。

#### 6. [Gists 备份](https://gist.github.com/xingangshi)

##### 6.1 [python3 installer](/000_gists_bak/python3_install.sh)

##### 6.2 [cmake get os info](/000_gists_bak/cmake_get_os_info.cmake)

##### 6.3 [cron snapshots](/000_gists_bak/cron_info.txt)

##### 6.4 [nodejs req vs resp with error info](/000_gists_bak/nodejs_req_vs_res.js)

##### 6.5 [vim installer](/000_gists_bak/vim_install.sh)

##### 6.6 [pypy vs py2 vs py3](/000_gists_bak/pypy_vs_py2_vs_py3)
> [test_pypy.py](/000_gists_bak/pypy_vs_py2_vs_py3/test_pypy.py)
>
> [run_test.sh](/000_gists_bak/pypy_vs_py2_vs_py3/run_test.sh)

##### 6.7 [xcode vim plugin installer](/000_gists_bak/xvim2_installer.sh)

##### 6.8 [a simple dict installer](/000_gists_bak/abc_dict_install.sh)
> [A simple one hundred thousand dict install for using by local](/000_gists_bak/abc_dict_install.sh)

##### 6.9 [delete all weibo](/000_gists_bak/delete_weibo_poster.js)
> [delete all weibo you post](/000_gists_bak/delete_weibo_poster.js)

##### 6.10 [termux android keyboard](/000_gists_bak/termux.properties)
> [termux for andriod keyboard setting](/000_gists_bak/termux.properties)

##### 6.11 [generate a qdcode by terminal](/000_gists_bak/generate_qrenco.sh)
> [genarete a qrcode for every things](/000_gists_bak/generate_qrenco.sh)

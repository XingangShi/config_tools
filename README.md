## config_tools
一些常用的配置、工具，主要涉及到 linux、macos，也包括一些有用的素材和信息。

---

### 自己用过的命令行的集锦
> 自己用过的命令行的集锦，温故知新。
>
> 如题，详情见：[awesome_commnd_tips.md](/awesome_commnd_tips.md)


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

#### 3.6 增加个人 Sublime_Text_3 配置
>
> [Preferences.sublime-settings](/003_windows/Preferences.sublime-settings)


### 4. 迁移博客中的第三方图床的图片到本地化
> 由于之前使用的两个图床 ： [Imgur](https://i.imgur.com)（国内访问不稳定） 和 新浪图床（不允许第三方平台调用），所以打算把博客两个图床的图片全部爬下来，迁移到 github。
>
> 详情见目录： [004_localizating_the_pics_of_blog_post](/004_localizating_the_pics_of_blog_post)。

### 5. 使用 reveal-md 来做 md 文件的 PPT 展示
> 一个 [Markdown](https://www.geekpanshi.com/archives/e0c74487.html) 的中重度患者，在被要求做一个 PPT 的演讲时，毅然决然的走向了基于 MARKDOWN 的 PPT 展示探索，很幸运的是已经有了成熟的方案 [reveal-md](https://github.com/webpro/reveal-md)
>
> 请见请链接：[005_reveal-md-for_md_ppt_show](/005_reveal-md-for_md_ppt_show)。


### 使用 reveal-md 来做 md 文件的 PPT 展示

---

#### 1. 去官网下载 Nodejs : node-v10.16.0-x64.msi

#### 2. 选择默认安装选项。

#### 3. 打开 Windows Terminal，输入 `npm --version`，查看安装是否成功。显示如下：
```Lua
GeekPanshi MINGW64 /e/for_shard
$ npm --version
5.6.0
```

#### 4. 安装 reveal-md，命令行输入 `npm install -g reveal-md`
```Lua
C:\Users\GeekPanshi\AppData\Roaming\npm\reveal-md -> C:\Users\GeekPanshi\AppData\Roaming\n
pm\node_modules\reveal-md\bin\reveal-md.js
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.9 (node_modules\rev
eal-md\node_modules\fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@
1.2.9: wanted {"os":"darwin","arch":"any"} (current: {"os":"win32","arch":"x64"}
)

+ reveal-md@3.0.5
updated 1 package in 16.201s

C:\Users\GeekPanshi>reveal-md --version
3.0.5
```


#### 4. 用 reveal-md 打开自己编辑好的 Markdown 格式的 "PPT" 文件
> 命令格式 `reveal-md 符合PPT要求的Markdown格式文件.md --theme 指定主题  --port 指定端口号`。
```Lua
GeekPanshi MINGW64 ~/Desktop/for_shard
$ reveal-md git_From_novice_to_master.md --theme solarized --port 8001
Reveal-server started at localhost:8001
```

#### 5. 用 reveal-md 将 md 文件导出成 Pdf 格式。
> 命令格式 `reveal-md 符合PPT要求的Markdown格式文件.md --print 需要导出的PDF的文件名.pdf`。
```Lua
GeekPanshi MINGW64 /e/for_shard
$ reveal-md git_From_novice_to_master.md --print git_From_novice_to_master.pdf
Reveal-server started at localhost:1948
Attempting to print "git_From_novice_to_master.md" to "git_From_novice_to_master.pdf".
```

#### 6. 可以通过配置 json 文件 reveal.json 来自定义 reveal-md 展示效果
> 我的配置如下
```json
{
  "controls": true,
  "controlsTutorial" : true,
  "progress": true,
  "slideNumber": true,
  "hash": true,
  "history": true,
  "overview": true,
  "transitionSpeed": "slow",
  "transition": "zoom",
  "showNotes": true
}
```
> 更多配置请参考：[reveal-md](https://github.com/webpro/reveal-md)

#### 7. reveal-md 展示 md 为 PPT 时的一些特殊语法说明
##### 7.1 PPT 之间分隔
> `---`，横向左右切换 PPT 页面，使用 3 个短横线；`----`, 垂直上下切换 PPT 页面，使用 4 个短横线。
```lua
A
---
B
----
B_1
----
B_2
---
C
```

##### 7.2 增加 Note 备注，可以供讲演者自己看
> 需要备注的信息位于 `Note:` 和 PPT 页面横向分割线 `---` 或垂直分割线 `----` 之间的所有内容。
```lua
A
---
B
Note:
这里是备注
这里是备注
这里是备注
----
B_1
----
B_2
---
C
Note:
这里是备注
```

#### 8. 一些特殊说明
> 1. **reveal-md 是 Windows 的 Markdown 文件 PPT 展示的插件的**。
>
> 1. reveal.json 即使配置了 `"showNotes": true`，但是 md 中没有备注的页面的话，在演示时也是不会展示 Note 页面的边栏。
>
> 2. 使用 `--print` 将 md 文件转换为 PDF 文件时，文件内容格式可能发生变化的，需要注意的。
>
> 3. 其他语法和 markdown 几乎一致的, [Markdown 从入门到精通](https://www.geekpanshi.com/archives/e0c74487.html)。

#### 9. 文件说明：
> 1. [启动指定 md 文件的 PPT 展示](/005_reveal-md-for_md_ppt_show/1_start_ppt.bat)
>
> 2. [导出 md 文件到指定目录的 PDF](/005_reveal-md-for_md_ppt_show/2_generate_pdf.bat)
>
> 3. [reveal-md PPT 展示的 md 文件 demo](/005_reveal-md-for_md_ppt_show/demo.md)
>
> 4. [reveal-md PPT 展示的 json 配置样例](/005_reveal-md-for_md_ppt_show/reveal.json)

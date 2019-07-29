## 迁移博客中的第三方图床的图片到本地化

---

> 由于之前使用的两个图床 ： [Imgur](https://i.imgur.com)（国内访问不稳定） 和 新浪图床（不允许第三方平台调用），所以打算把博客两个图床的图片全部爬下来，迁移到 github。
>
> 步骤：
>
>> 1. 根据文章的名称特点生成一个唯一索引给每一个文章在指定目录建立一个图片的保存目录，图片的名称用之前图床所生成的文件名。
>>
>> 2. 之前使用图床的图片 URL 全部换成本地路径的图片地址。

### 1. Env infos;
#### 1.1 Python verison : 2.7.12
#### 1.2 Pip version : 19.1.1

### 2. Python third libs
> Need to install some python third libs
#### 1. pip install pathlib
#### 2. pip install requests

### NOTICE:
> 友情提示，请谨慎操作，尤其是“覆盖原目录” ：recover_dirs() 函数的调用，

### 自己用过的命令行的集锦，温故知新

---

#### 1. Linux

##### 1.1 Git 获取 2019 年所有的分支名称
> Git 基于 GitFlow 的分制管理，获取分支信息，并从近到远排序。
>
> `$git branch -r | grep "v_2019" | awk -F/ '{print $2"/"$3}' | sort -r -f`

##### 1.2 pip 安装不使用缓存
> 自己写 pip 库时，有时候刚发布版本，会发现测试安装时还是使用旧的版本。
>
> 1. 使用参数 `--no-cache-dir` 参数
>
> 2. 直接删除缓存
>>
>> 2.1 Linux and Unix `~/.cache/pip`
>>
>> 2.2 OS X `~/Library/Caches/pip`
>>
>> 2.3 Windows `%LocalAppData%\pip\Cache`

##### 1.3 Linux 创建用户和删除用户
> 创建用户用 `adduser` 不要用 `useradd`，删除用户用 `userdel`。
>
> **因为 `adduser` 会创建家目录，是一个 perl 写的交互式的创建用户，`useradd` 是个裸命令，创建的用户其实啥都干不了。**

##### 1.4 批量转换文件换行符
> 1. `$ find . -name "*.py" | xargs dos2unix`
>
> 2. `$ find . -name "*.sh" -exec dos2unix {} \;`
>
> 3. `$ find conf/ -name "*.*" |xargs sed -i 's/\r//'`
>
> 4. `$ sed -i 's/\r//' filename1 filename2 ...`
>
> **NOTE**：
>> 换成 `dos2unix` 换成 `unix2dos` 逆向操作。
>>
>> Linux 安装：
>>>
>>> 1. 命令行安装 `$ yum -y install dos2unix* unix2dos*`
>>>
>>  2. 安装包安装
>>> `$ wget http://terminus.sk/~hany/_data/hd2u/hd2u-1.0.3.tgz`
>>> `$ tar -xvf hd2u-1.0.3.tgz && cd hd2u-1.0.3`
>>> `$ ./configure && make && make install`
>>> `$ dos2unix --help`
>>
>> Windows 安装： [dos2unix 等工具包](https://sourceforge.net/projects/dos2unix/)
>>
>> 更多参考：[Dos2Unix / Unix2Dos - Text file format converters](https://waterlan.home.xs4all.nl/dos2unix.html)

#### 2. MacOs
##### 2.1

#### 3. Windows
##### 3.1 Pageant 加载指定的 PPK 公钥
> Pageant 是 TortoiseGit 中负责和服务端验证，通过加载公钥 ppk 来完成验证。
>
```Pyhton
@ 可以写到 autoAddkeys.bat 文件的
@ Pageant 加载指定的 PPK 公钥
@
@echo off

taskkill /f /t /im pageant.exe
"C:\Program Files\TortoiseGit\bin\pageant.exe" "D:\test\ssh_keys\id_rsa_win.ppk"`
exit
```

##### 3.2 GUI for Windows（MINGW64）加载指定秘钥
> 步骤：
>> 1. 启动 GUI 的命令行终端；
>> 2. 打开代理 shh-agent 代理；
>> 3. 添加授权过秘钥。
>> 4. 卸载秘钥。

```
GeekPanshi MINGW64 /e/for_shard
$ eval "$(ssh-agent -s)"
Agent pid 2498

GeekPanshi MINGW64 /e/for_shard
$ ssh-add ../selfDatas/ssh_keys/geekpanshi/geekpanshi_2048
Enter passphrase for ../selfDatas/ssh_keys/geekpanshi/geekpanshi_2048:
Identity added: ../selfDatas/ssh_keys/geekpanshi/geekpanshi_2048

GeekPanshi MINGW64 /e/for_shard
$ ssh-agent -k
unset SSH_AUTH_SOCK;
unset SSH_AGENT_PID;
echo Agent pid 2498 killed;
```

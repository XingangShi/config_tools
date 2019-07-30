### 自己用过的命令行的集锦，温故知新

---

#### 1. Linux

##### 1.1 Git 获取 2019 年所有的分支名称
> Git 基于 GitFlow 的分制管理，获取分支信息，并从近到远排序。
>
> `$git branch -r | grep "v_2019" | awk -F/ '{print $2"/"$3}' | sort -r -f`

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

```Python
GeekPanshi MINGW64 /e/for_shard
$ eval "$(ssh-agent -s)"
Agent pid 2498

GeekPanshi MINGW64 /e/for_shard
$ ssh-add ../selfDatas/ssh_keys/geekpanshi/geekpanshi_2048
Enter passphrase for ../selfDatas/ssh_keys/geekpanshi/geekpanshi_2048:
Identity added: ../selfDatas/ssh_keys/geekpanshi/geekpanshi_2048 (../selfDatas/ssh_keys/geekpanshi/geekpanshi_2048)

GeekPanshi MINGW64 /e/for_shard
$ ssh-agent -k
unset SSH_AUTH_SOCK;
unset SSH_AGENT_PID;
echo Agent pid 2498 killed;
```

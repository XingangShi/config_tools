### Debian 升级 7 - 10

---

#### 查看 Debian 版本
`$ cat /etc/os-release`
或者
`$ cat /etc/debian_version`

#### Debian 7 - 8
##### 1. 更新当前系统
`$ apt-get update && apt-get upgrade`

##### 2. 切换源到 Debian8
`$ sed -i 's/wheezy/jessie/g' /etc/apt/sources.list`

##### 3. 修改为 Debian8 源头
打开文件 `/etc/apt/sources.list`, 修改内容如下：
```bash
deb http://mirrors.163.com/debian/ jessie main non-free contrib
deb http://mirrors.163.com/debian-archive/debian/ jessie-backports main non-free contrib
deb-src http://mirrors.163.com/debian/ jessie main non-free contrib
deb-src http://mirrors.163.com/debian-archive/debian/ jessie-backports main non-free contrib
deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib
deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib
```
##### 5. 更新系统
> `$ apt-get update && apt-get upgrade`

##### 6. 执行系统更新
> `$ apt dist-upgrade`
##### 7. 重启服务器
> `$ reboot`
##### 8. 清理旧依赖包
> `$ apt-get autoremove`


#### Debian 8 - 9
**操作步骤和  [Debian 7 - 8](#debian-7---8) 几乎一样，只是需要替换不同的源，也就是之改变中的 2、3 步骤。**

##### 2. 切换源到 Debian9
> `$ sed -i 's/jessie/Stretch/g' /etc/apt/sources.list`

##### 3. 修改为 Debian9 源头
打开文件 `/etc/apt/sources.list`, 修改内容如下：
```bash
deb http://mirrors.163.com/debian/ stretch main non-free contrib
deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib
deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib
deb-src http://mirrors.163.com/debian/ stretch main non-free contrib
deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib
deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib
deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib
deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib
```

#### Debian 9 - 10
**操作步骤和  [Debian 7 - 8](#debian-7---8) 几乎一样，只是需要替换不同的源，也就是之改变中的 2、3 步骤。**
##### 2. 切换源到 Debian10
> `$ sed -i 's/stretch/buster/g' /etc/apt/sources.list`

##### 3. 修改为 Debian10 源头
打开文件 `/etc/apt/sources.list`, 修改内容如下：
```bash
deb http://mirrors.163.com/debian/ buster main non-free contrib
deb http://mirrors.163.com/debian/ buster-updates main non-free contrib
deb http://mirrors.163.com/debian/ buster-backports main non-free contrib
deb-src http://mirrors.163.com/debian/ buster main non-free contrib
deb-src http://mirrors.163.com/debian/ buster-updates main non-free contrib
deb-src http://mirrors.163.com/debian/ buster-backports main non-free contrib
deb http://mirrors.163.com/debian-security/ buster/updates main non-free contrib
deb-src http://mirrors.163.com/debian-security/ buster/updates main non-free contrib
```

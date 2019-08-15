### Python 启动一个简单本地服务器

---

#### 1. 下载安装
> 下载对应的 [python 版本](https://www.python.org/downloads/)并安装。

#### 2. 设置环境变量
> 安装好python后，搭配环境变量。
>>
>> 1. WIN-7 系统，`右键计算机 -> 属性 -> 高级系统设置 -> 环境变量 -> 系统变量 -> 找到 path`。
>>
>> 2. 双击 path 在变量值末尾添加 python 的安装路径。我的路径是 `C:\Python27`（注意添加时要在path已经存在的路径后面添加分号 ; 然后再添加python的路径）。
>>
>> 3. 配置好环境变量后，一路点确定，关闭所有窗口。

#### 3. 启动服务
> 把下面述的两个 bat 文件，拷贝到你你想共享的目录下，根据你所安装的 python 版本，选择启动的脚本。
>
> **Windows**：[server_with_port_5001.bat](/003_windows/python_local_server/server_with_port_5001.bat)
>
> **Linux**：[server_with_port_5001.sh](/003_windows/python_local_server/server_with_port_5001.sh)

#### 4. 在浏览器打开本地服务器
> 默认的 5001 对应的网址是
>
>> 1. [http://localhost:5001](http://localhost:5001/)
>>
>> 2. [http://127.0.0.1:5001](http://127.0.0.1:5001)

#### 备注
> 1. 可以用 记事本 打开 bat/sh 文件修改里面的端口号，这里默认端口是 5001。
>
> 2. 将 [start_local_http_server.py](/003_windows/python_local_server/start_local_http_server.py) 和 对应的启动脚本 [server_with_port_5001.bat](/003_windows/python_local_server/server_with_port_5001.bat) 或 [server_with_port_5001.sh](/003_windows/python_local_server/server_with_port_5001.sh) 放在需要作为服务器根目录的路径下即可。

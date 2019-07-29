#!/usr/bin/python
# --*-- coding:utf-8 --*--

import os, shutil

import requests
from pathlib import Path


'''
## 迁移博客中的第三方图床的图片到本地化

---

> 由于之前使用的两个图床 ： https://i.imgur.com（国内访问不稳定） 和 新浪图床（不允许第三方平台调用），所以打算把博客两个图床的图片全部爬下来，迁移到 github。
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
'''

### Clobal config

Gloabl_files = {}

Post_root_dir = "./_posts"
Pose_root_backup_dir = "%s_back" % Post_root_dir
Image_root_dir = "images"

# eg. 001_1-FD_2018_year_all_checker-2019.md, index : [0:5]
Special_post_regex_1_1 = "FD"
Special_post_regex_1_2 = "001"
Special_post_index_max_size = 5
# else
# eg. 199_git_From_novice_to_master.md, indeex : [0:3]
Normal_post_index_max_size = 3

# 图床特征标识
Image_hosting_service_Imgur = "imgur.com"
Image_hosting_service_Sina  = "sinaimg.cn"
PIC_suffix_Png = "png"
PIC_suffix_Jpg = "jpg"

# 获取图片下载地址
# eg1. - 'https://i.imgur.com/FNgdrZv.png'
# eg2. > ![GitNote](https://wx2.sinaimg.cn/large/006tNc79gy1fzxkga0obqj30yt0e3q43.jpg)
# eg3. >>  <img src="https://i.imgur.com/5EJ6XFh.jpg" width="400" height="500" div align=center />
# eg4. [小程序-图片]:https://i.imgur.com/Qlo5mNr.png "小程序，2018年倒计时"
Special_post_regex_2_1_1 = "-"
Special_post_regex_2_1_2 = "!" #不包含 "!" 的图片引用
Special_post_regex_2_1_3 = "]:" # 不包含 "]:" 的图片引用
Special_post_regex_2_2_1 = "("
Special_post_regex_2_2_2 = ")"
Special_post_regex_2_3_1 = 'width="400" height="500" div align=center />'
Special_post_regex_2_3_2 = "http"
Special_post_regex_2_3_3 = ' width="400"'
Special_post_regex_2_4_1 = "]:"
Special_post_regex_2_4_2 = ' "'


### 获取指定目录下所有的文件名并生成起相对路径
def get_all_file_names(file_dir):
    for root, dirs, files in os.walk(file_dir):
        for file_name in files:
            if (file_name.find(Special_post_regex_1_1) != -1
                and file_name.find(Special_post_regex_1_2) != -1):
                index = file_name[:Special_post_index_max_size]
            else:
                index = file_name[:Normal_post_index_max_size]
            Gloabl_files[str(index)] = "%s/%s" % (root, file_name)

# 检查文件是否包含图床图片的信息
def check_content_has_images(content):
    return ((content.find(Image_hosting_service_Imgur) != -1
        or content.find(Image_hosting_service_Sina) != -1)
        and (content.find(PIC_suffix_Png) != -1 or content.find(PIC_suffix_Jpg) != -1))

# 创建备份目录
def create_back_dir(raw_dir):
    back_dir = "%s_back" % raw_dir
    my_file = Path(back_dir)
    if not my_file.is_dir():
        os.makedirs(back_dir)
    return back_dir


# 处理所有 _post 目录下的文件，图片存到指定位置，并生成所有的使用本地文件的 _post
def redirect_infos(dir_name):
    total_post_has_pic = 0
    total_pics_num = 0
    for id, file_path in Gloabl_files.items():
        #if file_path.find("173_2-FD_my_life_records-2018.md") == -1:
        #    continue

        file_handle = open(file_path, "r+")

        #重定向替换掉的文件
        new_file_handle = open("%s/%s" % (create_back_dir(dir_name), file_path.split("/")[-1]), "w")

        pics_num = 0
        while True:
            content = file_handle.readline()
            if not content: break
            if check_content_has_images(content):
                if (content.find(Special_post_regex_2_1_1) != -1
                    and content.find(Special_post_regex_2_1_2) == -1
                    and content.find(Special_post_regex_2_1_3) == -1):
                    down_url = content[content.find(Special_post_regex_2_1_1) + 3 : -2]
                elif content.find(Special_post_regex_2_4_1) != -1:
                    down_url = content[content.find(Special_post_regex_2_4_1) + len(Special_post_regex_2_4_1) : content.find(Special_post_regex_2_4_2)]
                else:
                    down_url = content[content.find(Special_post_regex_2_2_1) + len(Special_post_regex_2_2_1) : content.find(Special_post_regex_2_2_2)]
                    if down_url.find(Special_post_regex_2_3_1) != -1:
                        down_url =  down_url[down_url.find(Special_post_regex_2_3_2): down_url.find(Special_post_regex_2_3_3) - 1]
                        down_file_name = down_url.split("/")[-1]

                if down_url:
                    down_file_name = down_url.split("/")[-1].split(" ")[0]

                    # 拼接替换后的本地图片地址
                    new_info = "%s/%s/%s/%s" %( content[:content.find(Special_post_regex_2_3_2)], Image_root_dir, id, content[content.find(down_file_name):])
                    new_file_handle.write(new_info)#print down_file_name

                    try:
                        r = requests.get(down_url)
                        doc_path = "./%s/%s" % (Image_root_dir, id)

                        my_file = Path(doc_path)
                        if not my_file.is_dir():
                            os.makedirs(doc_path)

                        with open("%s/%s" % (doc_path, down_file_name),'wb') as f:
                            pics_num += 1
                            f.write(r.content)
                    except Exception, e:
                        try:
                            print("Exception %s, file_path %s" % (e, file_path))
                        except Exception, e:
                            print("Exception %s" % e)
            else:
                new_file_handle.write(content)

        if pics_num:
            total_post_has_pic += 1
            total_pics_num += pics_num

        print("Id %s, total pics_num %-2s, file_name %s." % (id, pics_num, file_path[len(dir_name) + 1:]))
    return total_post_has_pic, total_pics_num

# 删除原本的目录，重命名生成的目录为原目录的文件夹名
def recover_dirs(dir_name):
    shutil.rmtree(dir_name)
    os.rename(create_back_dir(dir_name), dir_name)

def main():
    print(" ---- Start to localizating the pics of blog post ---- ")
    print(".")
    root_dir = Post_root_dir
    get_all_file_names(root_dir)

    total_post_has_pic, total_pics_num = redirect_infos(root_dir)
    recover_dirs(root_dir)
    print("")
    print("    Total Files Size %s." % len(Gloabl_files))
    print("")
    print("    Total %s Post has %s Pics." % (total_post_has_pic, total_pics_num))
    print(".")
    print(" ---- End to localizating the pics of blog post ---- ")

if __name__ == '__main__':
    main()

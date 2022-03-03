## 如何删除 git 历史中的大文件

### 1. 查找 git 历史中的大文件信息或者想要删除的敏感信息文件
（refer to: [How to find/identify large commits in git history?](https://stackoverflow.com/questions/10622179/how-to-find-identify-large-commits-in-git-history)）

```shell
git rev-list --objects --all |
   git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
   sed -n 's/^blob //p' |
   sort --numeric-sort --key=2 |
   cut -c 1-12,41- |
   $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=neares
```

### 2. 使用 [bfg-cleaner](https://rtyley.github.io/bfg-repo-cleaner/) 删除文件
（refer to：[Removing sensitive data from a repository](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)）

确保安装了 `java`。

1. 下载工具

```shell
wget -P ~/ https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar
```

2. 使用 1 中的 方法查找到要删除的大文件或者敏感信息文件

3. 删除指定文件名的文件

```shell
java -jar ~/bfg-1.14.0.jar -D <file>
```

4. 删除超过指定大小的文件

```shell
java -jar ~/bfg-1.14.0.jar --strip-blobs-bigger-than 15K/15M
```

5. 删除历史记录病压缩文件

```
git reflog expire --expire=now --all && git gc --prune=now --aggressive
```

6. 强制 `push` 到远端

```shell
git push -f
```

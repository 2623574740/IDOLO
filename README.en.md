> 使用了清华源替换Debian的原源
>
> docker使用的了轩辕镜像，在此感谢大神提供的镜像服务

# 安装

你最好使用 `scp` 命令将 `.tar` 文件发送到 Debian 系统上。

```cmd
scp xxx.zip root@Debian_host:/root
```

然后解压 `.tar` 文件。

```shell
tar -xvf xxx.tar
```

好的~现在请对刚刚解压的文件夹及其子目录中的所有文件进行授权。

```shell
chown -R newuser /root/
```

最后，使用 `install.sh` 文件离线安装 Docker。

```shell
bash /root/install_docker/install.sh
```

# 卸载

请运行 `bash /root/install_docker/unins.sh` 从 Debian 操作系统中卸载 Docker。 
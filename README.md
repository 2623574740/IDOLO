> 使用了清华源替换Debian的原源
>
> docker使用的了轩辕镜像，在此感谢大神提供的镜像服务

# 安装

你最好使用 `scp` 命令将 `.tar` 文件发送到 Debian 系统上。

```cmd
scp install_docker_on_debian(x64)_offline.tar root@Debian_host:/root
```

然后解压 `.tar` 文件。

```shell
mkdir /root/install_docker
tar -xvf install_docker_on_debian(x64)_offline.tar -C /root/install_docker
```

好的~现在请对刚刚解压的文件夹及其子目录中的所有文件进行授权。

```shell
chmod -R 777 /root/install_docker
```

最后，使用 `install.sh` 文件离线安装 Docker。

```shell
bash /root/install_docker/install.sh
```

# 卸载

请运行 `bash /root/install_docker/unins.sh` 从 Debian 操作系统中卸载 Docker。 
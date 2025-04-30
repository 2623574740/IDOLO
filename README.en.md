# Install

You'd better use the `scp` command send the `.tar` file to Debian

```cmd
scp install_docker_on_debian(x64)_offline.tar root@Debian_host:/root
```

and then extract the `.tar` file

```shell
mkdir /root/install_docker
tar -xvf install_docker_on_debian(x64)_offline.tar -C /root/install_docker
```

ok~now Please authorize all the files in the just-decompressed folder and its subdirectories

```shell
chmod -R 777 /root/install_docker
```

at last, install docker offline with `install.sh` file

```shell
bash /root/install_docker/install.sh
```



# Uninstall

please run `bash /root/install_docker/unins.sh` to uninstall docker from Debian OS 
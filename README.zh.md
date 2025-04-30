# Install

You'd better use the `scp` command send the `.tar` file to Debian

```cmd
scp xxx.zip root@Debian_host:/root
```

and then extract the `.tar` file

```shell
tar -xvf xxx.tar
```

ok~now Please authorize all the files in the just-decompressed folder and its subdirectories

```shell
chown -R newuser /root/
```

at last, install docker offline with `install.sh` file

```shell
bash /root/install_docker/install.sh
```



# Uninstall

please run `bash /root/install_docker/unins.sh` to uninstall docker from Debian OS 
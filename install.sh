#!/bin/bash
# author: jarry
# description: Install docker offline on Debian 12
# date: 2025-04-30
export LANG=en_US.UTF-8

dependency_packages=("net-tools" "ca-certificates" "curl" "libnfnetlink0" "libip6tc2" "libnetfilter-conntrack3")
for package in "${dependency_packages[@]}"; do
    # 检查系统中是否安装
    if dpkg -s ${package} >/dev/null 2>&1; then
        echo "${package} installed"
    else
        sudo dpkg -i ./dependency/${package}*.deb
        if dpkg -s ${package} >/dev/null 2>&1; then
            echo "${package} installed successfully"
        else
            echo "${package} installed failed, trying fix dependences"
            sudo apt-get install -f
        fi
    fi
done

# 清理环境中的旧版docker
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do
    sudo apt-get remove $pkg;
done

# 安装docker密钥环
cat ./conf/gpg > /etc/apt/keyrings/docker.gpg

# docker官方软件源的具体地址
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# 备份源
cp /etc/apt/sources.list ~/sources.list.bak
# cp /etc/apt/sources.list.d/raspi.list ~/raspi.list.bak
# 换清华源
cat ./conf/sources.list > /etc/apt/sources.list
cat ./conf/debian.sources > /etc/apt/sources.list.d/debian.sources
sudo apt-get update 

docker_packages=("containerd.io" "docker-ce-cli" "docker-buildx-plugin" "docker-compose-plugin" "docker-ce")
for package in "${docker_packages[@]}"; do
    sudo dpkg -i ./packages/${package}*.deb
    if dpkg -s ${package} >/dev/null 2>&1; then
        echo "${package} installed successfully"
    else
        echo "${package} installed failed, trying fix dependences"
        sudo apt-get install -f
    fi
done

# 配置镜像源
mkdir /etc/docker
cat ./conf/daemon.json > /etc/docker/daemon.json
sudo systemctl daemon-reload
sudo systemctl stop docker.socket docker.service
sudo systemctl start docker.socket docker.service

echo "docker is installed, please use 'docker pull hello' command for test"
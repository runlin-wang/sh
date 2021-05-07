#! /bin/bash

# todo CentOS 7 或者 8
# CentOS 7 及之前为 CentOS-Base.repo，CentOS 8 为CentOS-Linux-*.repo

# 备份
sudo cp /etc/yum.repos.d/CentOS-Linux-BaseOS.repo /etc/yum.repos.d/CentOS-Linux-BaseOS.repo.backup

# CentOS 8
# aliyun
# sudo wget -O /etc/yum.repos.d/CentOS-Linux-BaseOS.repo https://mirrors.aliyun.com/repo/Centos-8.repo

# tsinghua
sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org|baseurl=https://mirrors.tuna.tsinghua.edu.cn|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-Linux-BaseOS.repo


# 生成缓存
yum makecache

# 下载软件
sudo yum install wget git zsh neovim -y

# 下载 ohmyzsh
sh -c "$(wget https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh@master/tools/install.sh -O -)"

# 安装 zsh 高亮 自动补全 插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 下载配置文件
mkdir -p ~/.config/nvim
mkdir ~/.vim
wget https://cdn.jsdelivr.net/gh/runlin-wang/.config@main/zsh/zshrc
wget -P ~/.config/nvim/ https://cdn.jsdelivr.net/gh/runlin-wang/.config@main/simple/init.vim
wget -P ~/.vim/ https://cdn.jsdelivr.net/gh/runlin-wang/.config@main/simple/vimrc

#! /bin/bash

sudo yum install zsh neovim git wget

# 下载 ohmyzsh
sh -c "$(wget https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh@master/tools/install.sh -O -)"

# 安装 zsh 高亮 自动补全 插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 下载配置文件
wget https://cdn.jsdelivr.net/gh/runlin-wang/dotfiles@master/Mackup/.zshrc
wget -P ~/.config/nvim/ https://cdn.jsdelivr.net/gh/runlin-wang/dotfiles@master/Mackup/simple/init.vim
wget -P ~/.vim/ https://cdn.jsdelivr.net/gh/runlin-wang/dotfiles@master/Mackup/simple/vimrc

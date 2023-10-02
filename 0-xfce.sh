#!/bin/bash

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo -e "\e[1;31m Please run as sudo or root \e[0m"
  exit 1
fi

clear

# apt update
echo -e "\e[1;32m Refreshing Repositories \e[0m"
apt update && apt upgrade -y
apt install -y aptitude
apt install -y nala

# Get username
username=$(id -u -n 1000)
builddr=$(pwd)

# remove not required packages
echo -e "\e[1;32m Remove not required packages \e[0m"
apt purge -y hypnotix celluloid rhythmbox pix catfish redshift-gtk warpinator drawing hexchat thunderbird

# System Monitors
echo -e "\e[1;32m Installing conky nefetch htop \e[0m"
apt install -y conky neofetch htop

# Dockbarx
add-apt-repository -y ppa:xuzhen666/dockbarx
apt-get update
apt-get install -y dockbarx xfce4-dockbarx-plugin

# xfce plugins
apt install -y clipman xfce4-climpan-plugin
apt install -y xfce4-panel-profiles

# Download Managers
echo -e "\e[1;32m Installing download managers \e[0m"
apt install -y curl wget axel aria2

# translator
echo -e "\e[1;32m Installing translator \e[0m"
apt install -y translate-shell

# redshift
echo -e "\e[1;32m Installing redshift \e[0m"
apt install -y redshift

# exa
echo -e "\e[1;32m Installing exa \e[0m"
apt install -y exa

# Text editor
echo -e "\e[1;32m Installing geany, micro and neovim \e[0m"
apt install -y geany micro neovim
# git clone https://github.com/VundleVim/Vundle.vim.git /home/$username/.vim/bundle/Vundle.vim

# Media Player
apt install -y mpv

# kdeconnect
apt install -y kdeconnect

# terminal of choice
echo -e "\e[1;32m Installing terminal \e[0m"
add-apt-repository -y ppa:aslatter/ppa
apt update
apt install -y alacritty

# libreoffice install
echo -e "\e[1;32m Installing libreoffice and its themes \e[0m"
apt install -y libreoffice-style*

# ani-cli
echo -e "\e[1;32m Installing ani-cli for anime lovers \e[0m"
apt install -y fzf
git clone "https://github.com/pystardust/ani-cli.git"
install ani-cli/ani-cli /usr/local/bin
rm -rf ani-cli

# Goolge Chrome
# echo -e "\e[1;32m Installing google chrome \e[0m"
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# apt install -y ./google-chrome-stable_current_amd64.deb
# rm google-chrome-stable_current_amd64.deb

# fast-cli
echo -e "\e[1;32m Installing fast-cli for Internet speed test \e[0m"
wget https://github.com/ddo/fast/releases/download/v0.0.4/fast_linux_amd64 -O fast
chmod +x fast
mv fast /usr/local/bin

# setup starship
echo -e "\e[1;32m Installing starship shell prompt \e[0m"
wget https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-musl.tar.gz
tar -xvzf starship-x86_64-unknown-linux-musl.tar.gz
mv starship /usr/local/bin
rm starship-x86_64-unknown-linux-musl.tar.gz

# mkdir
echo -e "\e[1;32m Creating directory ISO in home folder \e[0m"
mkdir /home/$username/ISOs
chown $username:$username /home/$username/*

# pfetch
echo -e "\e[1;32m Installing pfetch \e[0m"
git clone https://github.com/dylanaraps/pfetch.git
cd pfetch
install pfetch /usr/local/bin
cd ..
rm -rf pfetch

# config files
echo -e "\e[1;32m Copying config files \e[0m"
cd /home/$username
git clone https://github.com/ankit90s/dotconfig && cd dotconfig
chown -R $username:$username *
cd $builddr

# copy bashrc and bash_aliases
echo -e "\e[1;32m Installing bashrc and bash aliases \e[0m"
cp bashrc /home/$username/.bashrc
cp bash_aliases /home/$username/.bash_aliases

echo
echo -e "\e[1;32m Rebooting please wait \e[0m"

sleep 5s
reboot

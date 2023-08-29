#!/bin/bash

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo -e "\e[1;31m Please run as sudo or root \e[0m"
  exit 1
fi

add-apt-repository ppa:xuzhen666/dockbarx
apt-get update
apt-get install dockbarx

#!/bin/bash
version=0.37.1
wget -O frp_linux_386.tar.gz "https://github.com/fatedier/frp/releases/download/v${version}/frp_${version}_linux_386.tar.gz"
tar -zxvf frp_linux_386.tar.gz
mv -f frp_${version}_linux_386/* /frp/
rm -rf frp_${version}_linux_386/
rm -rf frp_linux_386.tar.gz
chmod -R 777 /frp/
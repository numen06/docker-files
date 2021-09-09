#!/bin/bash
version=0.37.1
#wget -O frp_linux_amd64.tar.gz "https://github.com/fatedier/frp/releases/download/v0.37.1/frp_$version_linux_amd64.tar.gz"
wget -O frp_linux_amd64.tar.gz "https://numen-share.oss-cn-shanghai.aliyuncs.com/frp/frp_${version}_linux_arm64.tar.gz"
tar -zxvf frp_linux_amd64.tar.gz
mv -f frp_${version}_linux_arm64/* /frp/
rm -rf frp_${version}_linux_arm64/
chmod -R 777 /frp/
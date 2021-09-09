#!/bin/bash
version=0.37.1
tarfile=frp.tar.gz
wget -O ${tarfile} "https://github.com/fatedier/frp/releases/download/v${version}/frp_${version}_linux_386.tar.gz"
tar -zxvf ${tarfile}
mv -f frp_${version}_linux_386/* /frp/
rm -rf frp_${version}_linux_386/
rm -rf ${tarfile}
chmod -R 777 /frp/
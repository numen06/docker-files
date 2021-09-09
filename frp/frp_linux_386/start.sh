#!/bin/bash
if [ "$MODE" = "client" ];then
  echo '客户端模式启动'
  ./frpc -c ./frpc.ini
else 
  echo '服务端模式启动'
  ./frps -c ./frps.ini
fi
echo 'FRP关闭'

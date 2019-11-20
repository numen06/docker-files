# docker-frp
主要用于内网穿透服务


#linux 使用docker部署
#启动frp的服务器frps
docker run -itd --net='host' --name frps --restart=always registry.cn-shanghai.aliyuncs.com/numen/frp:0.29.1 ./frps -c ./frps.ini

docker run -itd --net='host' --name frps --restart=always -v /opt/frp/frps.ini:/frp/frps.ini registry.cn-shanghai.aliyuncs.com/numen/frp:0.29.1 ./frps -c ./frps.ini

#启动frp的客户端frpc
docker run -itd --net='host' --name frpc --restart=always -v /opt/frp/frpc.ini:/frp/frpc.ini registry.cn-shanghai.aliyuncs.com/numen/frp:0.29.1 ./frpc -c ./frpc.ini

附件为windows客户端，install.bat安装为服务,启动后选择frpc.exe
#在opt下映射配置文件信息
#简单模式
docker run --restart=always --name canal-server \
-e canal.instance.master.address=192.168.20.161:3306 \
-e canal.instance.dbUsername=slave \
-e canal.instance.dbPassword=abc123 \
-p 11111:11111 \
-v /opt/canal/logs:/home/admin/canal-server/logs \
-d canal/canal-server


docker run --restart=always --name canal-server \
-e canal.instance.master.address=192.168.20.161:3306 \
-e canal.instance.dbUsername=root \
-e canal.instance.dbPassword=Hubao@20170604 \
-p 11111:11111 \
-v /opt/canal/logs:/home/admin/canal-server/logs \
-d canal/canal-server


#集群模式
docker run --name canal-server \
-e canal.instance.master.address=192.168.20.223:3306 \
-e canal.instance.dbUsername=slave \
-e canal.instance.dbPassword=abc123 \
-e canal.zkServers=192.168.20.223:2181 \
-e canal.ip=192.168.20.223 \
--net=host \
-v /opt/canal/logs:/home/admin/canal-server/logs \
-d canal/canal-server


#kafka模式
docker run --name canal-server \
-e canal.instance.master.address=192.168.20.223:3306 \
-e canal.instance.dbUsername=slave \
-e canal.instance.dbPassword=abc123 \
-e canal.serverMode=kafka \
-p 11111:11111 \
-v /opt/canal/conf/mq.yml:/home/admin/canal-server/conf/mq.yml \
-v /opt/canal/conf/logback.xml:/home/admin/canal-server/conf/logback.xml \
-v /opt/canal/logs:/home/admin/canal-server/logs \
-d canal/canal-server
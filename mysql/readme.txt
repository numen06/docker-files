#启动Master机
docker run -itd -p 3306:3306 --restart always --name mysql-master -v /etc/localtime:/etc/localtime:ro -v /opt/mysql/conf/master/my.cnf:/etc/mysql/my.cnf -v /opt/mysql/data/master:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=abc123 mysql:5.7

#进入主机
docker exec -it mysql-master /bin/bash
mysql -uroot -pabc123

#授权
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'abc123' WITH GRANT OPTION;

mysql> GRANT REPLICATION SLAVE ON *.* to 'slave'@'%' identified by 'abc123';

mysql> GRANT ALL PRIVILEGES ON *.* TO 'slave'@'%' ;

mysql> FLUSH PRIVILEGES;

mysql> show master status;

#授权完成之后重启docker
exit
exit
docker restart mysql-master

#启动Slave机
docker run -itd -p 3307:3306 --restart always --name mysql-slave -v /etc/localtime:/etc/localtime:ro -v /opt/mysql/conf/slave/my.cnf:/etc/mysql/my.cnf -v /opt/mysql/data/slave:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=abc123 mysql:5.7

#进入主机
docker exec -it mysql-slave /bin/bash
mysql -uroot -pabc123

#授权
mysql> grant SHOW DATABASES,SELECT on *.* to 'slave'@'%' identified by 'abc123';
mysql> FLUSH PRIVILEGES;

#挂载主机,file根据master的查询出来的信息为准
mysql> change master to master_host='192.168.20.223',master_user='slave',master_password='abc123',master_log_file='mysql-bin.000004',master_log_pos=501;

mysql> start slave;

mysql> show slave status\G

#授权完成之后重启docker
exit
exit
docker restart mysql-slave
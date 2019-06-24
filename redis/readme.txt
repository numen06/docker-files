docker run --name redis-master -p 6379:6379 -d redis
docker run -p 6379:6379 --network=hubao --restart=always -v /etc/localtime:/etc/localtime:ro -v /opt/redis/data:/data -v /opt/redis/redis.conf:/usr/local/etc/redis/redis.conf --name redis-slave1 -itd redis redis-server /usr/local/etc/redis/redis.conf
docker run -p 6379:6379 --network=hubao --restart=always -v /etc/localtime:/etc/localtime:ro -v /opt/redis/data:/data -v /opt/redis/redis.conf:/usr/local/etc/redis/redis.conf --name redis-slave2 -itd redis redis-server /usr/local/etc/redis/redis.conf
docker run -p 6379:6379 --network=hubao --restart=always -v /etc/localtime:/etc/localtime:ro -v /opt/redis/data:/data -v /opt/redis/redis.conf:/usr/local/etc/redis/redis.conf --name redis-slave3 -itd redis redis-server /usr/local/etc/redis/redis.conf 

#下载对应的配置文件
mkdir /opt/redis  
wget https://raw.githubusercontent.com/antirez/redis/3.0/redis.conf -O /opt/redis/redis.conf
cd /opt/redis/  
sed -i 's/# slaveof <masterip> <masterport>/slaveof redis-master 6379/g' redis.conf  
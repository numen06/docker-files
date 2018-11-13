
#在运行或启动elasticsearch容器前，先在宿主机上执行 sudo sysctl -w vm.max_map_count=262144;

docker run -itd --name elasticsearch --privileged=true -p 9100:9100 -p 9200:9200 -p 9300:9300 -v /opt/elasticsearch/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml es-ik
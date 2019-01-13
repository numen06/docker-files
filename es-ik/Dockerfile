FROM elasticsearch:5.6.8
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get install zip
RUN mkdir -p /usr/share/elasticsearch/plugins/
RUN chmod -R 777 /usr/share/elasticsearch
#RUN cd /usr/share/elasticsearch/plugins/ && wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v5.6.8/elasticsearch-analysis-ik-5.6.8.zip && unzip elasticsearch-analysis-ik-5.6.8.zip
ADD elasticsearch-analysis-ik-5.6.8.zip /usr/share/elasticsearch/test/elasticsearch-analysis-ik-5.6.8.zip
RUN unzip -d /usr/share/elasticsearch/test /usr/share/elasticsearch/test/elasticsearch-analysis-ik-5.6.8.zip
RUN mv /usr/share/elasticsearch/test/elasticsearch /usr/share/elasticsearch/plugins/ik
RUN rm -rf /usr/share/elasticsearch/test/elasticsearch-analysis-ik-5.6.8.zip
RUN sysctl -w vm.max_map_count=655360
RUN echo "vm.max_map_count=655360" > /etc/sysctl.conf 
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
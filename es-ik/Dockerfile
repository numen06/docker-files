FROM elasticsearch:5.6.8
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get install zip
RUN mkdir -p /usr/share/elasticsearch/plugins/
RUN cd /usr/share/elasticsearch/plugins/ && wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v5.6.8/elasticsearch-analysis-ik-5.6.8.zip && unzip elasticsearch-analysis-ik-5.6.8.zip
RUN mv /usr/share/elasticsearch/plugins/elasticsearch /usr/share/elasticsearch/plugins/ik
RUN rm -rf /usr/share/elasticsearch/plugins/elasticsearch-analysis-ik-5.6.8.zip
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "vm.max_map_count=655360" > /etc/sysctl.conf 
FROM centos

RUN yum install -y wget
WORKDIR /frp
COPY . .
RUN chmod -R 777 .
RUN ./download.sh
RUN ls
#VOLUME /frp/frpc.ini
ENTRYPOINT ./start.sh
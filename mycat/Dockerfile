FROM java:8-jdk

RUN mkdir -p /usr/local/

WORKDIR /usr/local/
#yum install wget
RUN wget http://dl.mycat.io/1.6-RELEASE/Mycat-server-1.6-RELEASE-20161028204710-linux.tar.gz
RUN tar -xzvf *.gz

RUN chmod -R 777 /usr/local/mycat

EXPOSE 8066 9066 3306

ENTRYPOINT ["/usr/local/mycat/bin/mycat", "console"]]
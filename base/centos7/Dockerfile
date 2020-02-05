From centos:7

#安装jdk
RUN yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel

#安装python3.8
RUN yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make
 
RUN yum -y install libffi-devel wget


#  建立新目录
RUN mkdir /usr/local/python3 
RUN mkdir /root/temp
WORKDIR /root/temp
 
#  以3.6.2为例，需要下载高版本请访问：https://www.python.org/ftp/python
RUN wget --no-check-certificate https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz 
 
#  解压安装包
RUN tar xzvf Python-3.8.0.tgz  -C /usr/local/python3


WORKDIR Python-3.8.0
 
#  编译安装
#RUN ./conigure --prefix=/usr/local/python3
RUN make && make install
RUN ln -s /usr/local/python3/bin/python3 /usr/bin/python3

RUN rm -rf /root/temp


WORKDIR /
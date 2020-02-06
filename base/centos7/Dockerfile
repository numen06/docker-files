From centos:7

MAINTAINER wesley.zhang<numen06@qq.com>

#设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#安装wget
RUN yum -y install wget

RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

RUN yum makecache


ARG PYTHON_VERSION=3.8.0
ARG OPENJDK_VERSION=1.8.0

#安装jdk
RUN yum -y install java-${OPENJDK_VERSION}-openjdk java-${OPENJDK_VERSION}-openjdk-devel

#安装python3.8
RUN yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make
 
RUN yum -y install libffi-devel wget


#  建立新目录
RUN mkdir /usr/local/python3 
RUN mkdir /root/temp
WORKDIR /root/temp
 
#  以3.6.2为例，需要下载高版本请访问：https://www.python.org/ftp/python
RUN wget --no-check-certificate https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz 
 
#  解压安装包
RUN tar zxvf Python-${PYTHON_VERSION}.tgz

RUN mv -f /root/temp/Python-${PYTHON_VERSION}/* /usr/local/python3

RUN rm -rf /root/temp

WORKDIR  /usr/local/python3
#编译安装
RUN ./configure --prefix=/usr/local/python3
RUN make && make install
#创建映射
RUN ln -s /usr/local/python3/bin/python3 /usr/bin/python3

#安装pip
RUN yum -y install python-pip
#升级pip
RUN pip install --upgrade pip

#安装git
RUN yum install -y git



#安装maven
ARG MAVEN_VERSION=3.6.3
ARG USER_HOME_DIR="/root"
ARG SHA=c35a1803a6e70a126e80b2b3ae33eed961f83ed74d18fcd16909b2d44d7dada3203f1ffe726c17ef8dcca2dcaa9fca676987befeadc9b9f759967a8cb77181c0
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha512sum -c - \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"


RUN yum clean all


WORKDIR /
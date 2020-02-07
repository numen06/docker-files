From centos:7

MAINTAINER wesley.zhang<numen06@qq.com>

#设置时区
ENV TIME_ZONE Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

#安装wget
RUN yum -y install wget

RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

RUN yum makecache


#安装python
#RUN yum -y groupinstall "Development tools"
RUN yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make
RUN yum install -y libffi-devel


# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

ENV GPG_KEY E3FF2839C048B25C084DEBE9B26995E310250568
ARG PYTHON_VERSION=3.8.1
ENV PYTHON_VERSION ${PYTHON_VERSION}

 
#  以3.8.0.为例，需要下载高版本请访问：https://www.python.org/ftp/python
RUN wget -O Python.tgz "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tgz"

#RUN wget -O Python.tgz "http://192.168.8.6:8000/Python-$PYTHON_VERSION.tgz"

ARG PYTHON_BUILD_DIR=/root/Python-${PYTHON_VERSION}

RUN mkdir -p /usr/src/python \
	&& tar zxvf Python.tgz -C /root/ \
	&& rm -rf Python.tgz 

RUN cd ${PYTHON_BUILD_DIR} \
    && ./configure \
	&& make install \
	&& rm -rf ${PYTHON_BUILD_DIR}
RUN python3 --version
# make some useful symlinks that are expected to exist
RUN cd /usr/local/bin \
	&& ln -s idle3 idle \
	&& ln -s pydoc3 pydoc \
	&& ln -s python3 python \
	&& ln -s python3-config python-config


#安装PIP
# if this is called "PIP_VERSION", pip explodes with "ValueError: invalid truth value '<VERSION>'"
ENV PYTHON_PIP_VERSION 20.0.2
# https://github.com/pypa/get-pip
ENV PYTHON_GET_PIP_URL https://github.com/pypa/get-pip/raw/d59197a3c169cef378a22428a3fa99d33e080a5d/get-pip.py
ENV PYTHON_GET_PIP_SHA256 421ac1d44c0cf9730a088e337867d974b91bdce4ea2636099275071878cc189e

RUN set -ex; \
	\
	wget -O get-pip.py "$PYTHON_GET_PIP_URL"; \
	echo "$PYTHON_GET_PIP_SHA256 *get-pip.py" | sha256sum -c -; \
	\
	python get-pip.py \
		--disable-pip-version-check \
		--no-cache-dir \
		"pip==$PYTHON_PIP_VERSION" \
	; \
	pip --version; \
	\
	find /usr/local -depth \
		\( \
			\( -type d -a \( -name test -o -name tests -o -name idle_test \) \) \
			-o \
			\( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
		\) -exec rm -rf '{}' +; \
	rm -f get-pip.py


#安装git
RUN yum -y install git


RUN yum clean all


WORKDIR /
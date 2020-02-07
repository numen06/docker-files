From registry.cn-hangzhou.aliyuncs.com/numen/base

MAINTAINER wesley.zhang<numen06@qq.com>


ENV NODE_VERSION=0.6.21

#RUN wget -O node.tar.gz "https://npm.taobao.org/mirrors/node/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
#  && tar -xvf node.tar.gz  -C /usr/local/ \
#  && rm -rf node.tar.gz \
#  && ln -s /usr/local/node-v$NODE_VERSION-linux-x64/bin/node /usr/local/bin \
#  && ln -s /usr/local/node-v$NODE_VERSION-linux-x64/bin/npm /usr/local/bin \
#  && node -v

RUN curl -sL https://rpm.nodesource.com/setup_6.x | bash -
RUN yum install -y nodejs
RUN node -v
RUN npm -v

ENV YARN_VERSION 1.21.1

#https://npm.taobao.org/mirrors/yarn/v1.21.1/yarn-v1.21.1.tar.gz
#https://npm.taobao.org/mirrors/yarn/1.21.1/yarn-v1.21.1.tar.gz
RUN wget "https://npm.taobao.org/mirrors/yarn/v$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /usr/local/ \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
  && rm -rf yarn-v$YARN_VERSION.tar.gz

#使用国内镜像
RUN npm config set registry https://registry.npm.taobao.org
RUN npm config get registry

RUN yum clean all

RUN npm install -g npm


WORKDIR /
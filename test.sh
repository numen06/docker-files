#!/bin/bash
docker rm -r minim-cloud-business;
docker run -itd --restart=always --name minim-cloud-business --privileged=true -v /opt/app/minim-cloud-business:/root registry.cn-shanghai.aliyuncs.com/numen/spring-boot-dev --spring.profiles.active=aliyun
FROM java:8
VOLUME /tmp
WORKDIR /root
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone

#RUN apt-get install lksctp-tools
RUN wget -c -O emqttd-3.0.rpm https://github-production-release-asset-2e65be.s3.amazonaws.com/7202769/11fe7600-f5a8-11e8-8057-14ae5c3fa608?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20181208%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20181208T134045Z&X-Amz-Expires=300&X-Amz-Signature=ab71efe5fe713a3cc4286b73f03b16a4c50d352d1735a5467db1a8ba699513ce&X-Amz-SignedHeaders=host&actor_id=2087963&response-content-disposition=attachment%3B%20filename%3Demqx-centos7-v3.0-rc.5.x86_64.rpm&response-content-type=application%2Foctet-stream

RUN rpm -ivh emqttd-3.0.rpm

EXPOSE 1883 8083 8883 8084 18083
ENTRYPOINT ["systemctl","start","emqx.service"]

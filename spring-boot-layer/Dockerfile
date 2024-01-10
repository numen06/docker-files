FROM dragonwell-registry.cn-hangzhou.cr.aliyuncs.com/dragonwell/dragonwell:8-anolis
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
VOLUME /tmp
WORKDIR /root
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
RUN chmod -R 777 /root
RUN bash -c 'touch app.jar'
#安装字体库
RUN yum install -y fontconfig
#安装网络工具
RUN yum install -y lrzsz net-tools vim wget

COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./

EXPOSE 8080
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]
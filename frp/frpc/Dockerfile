FROM centos

COPY frp_0.16.0_linux_amd64 /frp
RUN chmod -R 777 /frp
WORKDIR /frp
#VOLUME /frp/frpc.ini
ENTRYPOINT ./frpc -c ./frpc.ini
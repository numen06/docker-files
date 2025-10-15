FROM dragonwell-registry.cn-hangzhou.cr.aliyuncs.com/dragonwell/dragonwell:17-anolis
# 设置时区和语言（推荐用环境变量 + 软链接）
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 安装必要系统依赖（字体、网络工具等）
RUN yum install -y fontconfig net-tools lrzsz net-tools vim wget && \
    yum clean all && \
    rm -rf /var/cache/yum

EXPOSE 8080
# 使用 Spring Boot 的 JarLauncher 启动（非 -jar）
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "org.springframework.boot.loader.JarLauncher"]

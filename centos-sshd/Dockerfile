# 可以改为 FROM centos
FROM centos:7
MAINTAINER wesley.zhang

# 安装基础服务
RUN yum -y install vim unzip zip net-tools wget lrzsz passwd
#安装ssh服务
RUN yum install openssh-server -y 
#安装远程挂载
#RUN yum install epel-release -y
#RUN yum clean all
#RUN yum install fuse-sshfs -y
RUN yum clean all

#修改root用户密码为root
#用以下命令修改密码时，密码中最好不要包含特殊字符，如"!"，否则可能会失败；
RUN /bin/echo "root@123" | passwd --stdin root

#添加admin
RUN useradd admin
RUN /bin/echo "admin@123" | passwd --stdin admin
RUN chown -R admin /opt


#生成密钥
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_ecdsa_key \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_ed25519_key

#修改配置信息
RUN /bin/sed -i 's/.*session.*required.*pam_loginuid.so.*/session optional pam_loginuid.so/g' /etc/pam.d/sshd \
    && /bin/sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config \
    && /bin/sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config

EXPOSE 22

# 启动sshd服务
CMD ["/usr/sbin/sshd","-D"]

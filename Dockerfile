FROM centos:6
# 签名啦
MAINTAINER widuu "admin@widuu.com"

RUN yum install -y passwd
RUN yum install -y openssh
RUN yum install -y openssh-server
RUN yum install -y openssh-clients
RUN yum install -y sudo

RUN sed -ri "s/^UsePAM yes/#UsePAM yes/" /etc/ssh/sshd_config
RUN sed -ri "s/^#UsePAM no/UsePAM no/" /etc/ssh/sshd_config
RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop

RUN echo "root:dgj99349" | chpasswd

EXPOSE 22

EXPOSE 80

EXPOSE 443

EXPOSE 3306

# SSH终端服务器作为后台运行
CMD ["/usr/sbin/sshd", "-D"]

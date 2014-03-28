
# VERSION 0.0.1
# 默认ubuntu server长期支持版本，当前是12.10
FROM ubuntu
# 签名啦
MAINTAINER widuu "admin@widuu.com"

# 更新源，安装ssh server
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

# 设置root ssh远程登录密码为123456
RUN echo "root:123456" | chpasswd 


# SSH终端服务器作为后台运行
ENTRYPOINT /usr/sbin/sshd -D

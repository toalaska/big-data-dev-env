FROM debian:9
RUN echo <<EOF >/etc/apt/sources.list \
deb http://mirrors.ustc.edu.cn/debian/ stretch main non-free contrib \
deb http://mirrors.ustc.edu.cn/debian/ stretch-updates main non-free contrib \
deb http://mirrors.ustc.edu.cn/debian/ stretch-backports main non-free contrib \
deb-src http://mirrors.ustc.edu.cn/debian/ stretch main non-free contrib \
deb-src http://mirrors.ustc.edu.cn/debian/ stretch-updates main non-free contrib \
deb-src http://mirrors.ustc.edu.cn/debian/ stretch-backports main non-free contrib \
deb http://mirrors.ustc.edu.cn/debian-security/ stretch/updates main non-free contrib \
deb-src http://mirrors.ustc.edu.cn/debian-security/ stretch/updates main non-free contrib \
EOF

RUN apt-get update
RUN apt-get install openssh-server openjdk-8-jdk -y
 
RUN echo  "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /root/.bashrc
RUN echo  "export PATH=\$PATH:\$JAVA_HOME/bin" >> /root/.bashrc
RUN ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa

RUN apt-get install vim -y


EXPOSE 22 3306

# VOLUME /etc/hosts
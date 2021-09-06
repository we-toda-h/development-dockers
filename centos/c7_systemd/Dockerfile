FROM centos:7

LABEL maintainer "wetoda <we-toda@m.pscsrv.co.jp>"
LABEL org.opencontainers.image.authors="wetoda <we-toda@m.pscsrv.co.jp>"
LABEL org.opencontainers.image.url="https://github.com/we-toda-h/development-dockers"
LABEL org.opencontainers.image.source="https://github.com/we-toda-h/development-dockers/blob/main/centos/c7_systemd/Dockerfile"
LABEL org.opencontainers.image.version="0.0.1"

# 日本語環境設定
RUN sed -i -e '/override_install_langs/s/$/,ja_JP.utf8/g' /etc/yum.conf && \
    yum -y reinstall glibc-common && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"
RUN mv /etc/localtime /etc/localtime.org && \
    ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN yum -y update;yum -y install less; yum clean all;

WORKDIR /

ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# Install anything. The service you want to start must be a SystemD service.
##VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]

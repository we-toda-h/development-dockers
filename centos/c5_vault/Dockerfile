FROM centos:5

LABEL maintainer "wetoda <we-toda@m.pscsrv.co.jp>"

# centos5のyum設定を存在するURLに修正
COPY ./etc/yum.repos.d/ /etc/yum.repos.d/

RUN echo "override_install_langs=en_US.utf8,ja_JP.utf8" >> /etc/yum.conf && \
    echo "tsflags=nodocs" >> /etc/yum.conf

# 日本語環境設定
ENV LANG ja_JP.UTF-8
RUN mv /etc/localtime /etc/localtime.org && \
    ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    sed -i -e "s/ZONE=\"UTC\"/ZONE=\"Asia\/Tokyo\"/g" /etc/sysconfig/clock

RUN yum -y update;yum -y install less; yum clean all;

WORKDIR /

CMD ["/sbin/init"]

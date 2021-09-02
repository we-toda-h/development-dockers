## FROM wetoda/c7_systemd
FROM wetoda/dev-rakuza:centos7_systemd

LABEL maintainer "wetoda <we-toda@m.pscsrv.co.jp>"

# httpdサービスを有効化
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service

EXPOSE 80

CMD ["/usr/sbin/init"]

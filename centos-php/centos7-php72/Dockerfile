
FROM wetoda/c7_systemd_httpd

RUN yum update -y ; \
    yum install -y epel-release wget upstart;

# add repositroy remi
RUN rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi ; \
    yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
# add repositroy city-fan
RUN rpm --import https://mirror.city-fan.org/ftp/contrib/yum-repo/CITY-FAN.ORG-GPG-KEY ; \
    yum install -y https://mirror.city-fan.org/ftp/contrib/yum-repo/city-fan.org-release-2-1.rhel7.noarch.rpm

# curlをopenssl用にビルドしなおしたものを rpm からインストールする
COPY ./rpms /usr/local/src/rpms
WORKDIR /usr/local/src/rpms/x86_64

RUN yum --enablerepo=epel,city-fan.org \
        localinstall -y \
        curl-7.72.0-2.0.cf.rhel7.x86_64.rpm \
        libcurl-7.72.0-2.0.cf.rhel7.x86_64.rpm && \
    yum --enablerepo=epel,remi,remi-php72 \
        install -y \
        openssl openssl-devel \
        php php-gd php-imap php-json php-mbstring php-pgsql php-xml php-bcmath \
        php-pecl-mcrypt php-pecl-zip \
        php-pecl-xdebug

# install phan
# RUN yum install -y --enablerepo=epel,remi,remi-php72 composer
# RUN yum install -y --enablerepo=epel,remi,remi-php72 php-ast php-sqlite3 php-pdo
# RUN yum install -y --enablerepo=epel,remi,remi-php72 phan

# 日本語環境設定
## RUN sed -i -e '/override_install_langs/s/$/,ja_JP.utf8/g' /etc/yum.conf
## RUN yum -y reinstall glibc-common
## RUN localectl set-locale LANG=ja_JP.utf8
## RUN timedatectl set-timezone Asia/Tokyo
## RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
## ENV LANG="ja_JP.UTF-8" \
##     LANGUAGE="ja_JP:ja" \
##     LC_ALL="ja_JP.UTF-8"
## RUN mv /etc/localtime /etc/localtime.org && \
##     ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

WORKDIR /

# 作業ファイル削除
RUN rm -rf /usr/local/src/* ; yum clean all ;

COPY ./docker-entrypoint.sh  /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80
CMD ["/usr/sbin/init"]

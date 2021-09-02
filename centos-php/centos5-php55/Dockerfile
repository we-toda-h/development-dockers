
FROM wetoda/c5_vault

RUN yum update -y; yum install -y less epel-release;

# install [remi] repositroy
RUN rpm --import http://rpms.remirepo.net/RPM-GPG-KEY-remi ; \
    rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-5.rpm

# install [city-fan.org] repositroy
RUN rpm --import http://mirror.city-fan.org/ftp/contrib/yum-repo/CITY-FAN.ORG-GPG-KEY ; \
    rpm -Uvh http://mirror.city-fan.org/ftp/contrib/yum-repo/rhel5/x86_64/city-fan.org-release-1-13.rhel5.noarch.rpm
RUN sed -i -e 's/enabled=1/enabled=0/g' /etc/yum.repos.d/city-fan.org.repo 

# opensslをインストール
RUN yum --enablerepo=epel,remi,remi-php55,city-fan.org \
        install -y \
        openssl101e openssl101e-devel ; true

# 環境追加
RUN mkdir /usr/local/pkgconfig-openssl101e && \
    ln -s /usr/lib/pkgconfig/libcrypto101e.pc /usr/local/pkgconfig-openssl101e/libcrypto.pc && \
    ln -s /usr/lib/pkgconfig/libssl101e.pc    /usr/local/pkgconfig-openssl101e/libssl.pc && \
    ln -s /usr/lib/pkgconfig/openssl101e.pc   /usr/local/pkgconfig-openssl101e/openssl.pc && \
    echo /usr/lib64/openssl101e >> /etc/ld.so.conf.d/openssl101e.conf && \
    ldconfig

# opensslモジュールを更新したものをrpmでインストールする
COPY ./rpms /usr/local/src/rpms
WORKDIR /usr/local/src/rpms/RPMS/x86_64

# curlをインストール(openssl更新版)
RUN yum --enablerepo=epel,remi,remi-php55,city-fan.org --nogpgcheck \
        localinstall -y \
        curl-7.53.1-2.0.cf.rhel5.x86_64.rpm \
        libcurl-7.53.1-2.0.cf.rhel5.x86_64.rpm \
        ; true

# phpをインストール(openssl, curl 更新版)
# phpの足りないものを追加
RUN yum --enablerepo=epel,remi,remi-php55,city-fan.org --nogpgcheck \
        localinstall -y \
        php-5.5.38-7.el5.remi.x86_64.rpm \
        php-common-5.5.38-7.el5.remi.x86_64.rpm \
        php-cli-5.5.38-7.el5.remi.x86_64.rpm \
        php-gd-5.5.38-7.el5.remi.x86_64.rpm \
        php-imap-5.5.38-7.el5.remi.x86_64.rpm \
        php-mbstring-5.5.38-7.el5.remi.x86_64.rpm \
        php-pgsql-5.5.38-7.el5.remi.x86_64.rpm \
        php-xml-5.5.38-7.el5.remi.x86_64.rpm \
        php-bcmath-5.5.38-7.el5.remi.x86_64.rpm \
        php-pdo-5.5.38-7.el5.remi.x86_64.rpm \
        php-mcrypt-5.5.38-7.el5.remi.x86_64.rpm \
        && \
    yum --enablerepo=epel,remi,remi-php55,city-fan.org \
        install -y \
        php php-gd php-imap php-json php-mbstring php-pgsql php-xml php-bcmath php-mcrypt \
        php-pecl-mcrypt php-pecl-zip

# httpd自動起動
RUN chkconfig httpd on

WORKDIR /

# 作業ファイル削除
RUN rm -rf /usr/local/src/* ; yum clean all ;

COPY ./docker-entrypoint.sh  /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80
CMD ["/sbin/init"]

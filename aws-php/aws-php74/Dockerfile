
FROM amazonlinux:2

# 初期設定
RUN yum install -y glibc-langpack-ja less ;

## RUN yum update -y ; \
##     yum install -y epel-release wget;

# PHP7.4 を有効にする
RUN amazon-linux-extras install php7.4

# PHPをインストール
RUN yum install -y openssl curl && \
    yum install -y \
        php php-gd php-imap php-json php-mbstring php-pgsql php-xml php-bcmath \
        php-mcrypt php-pecl-mcrypt php-zip php-pecl-zip

# pecl-mcrypt のインストール
RUN yum install -y \
        gcc make php-pear php-devel libmcrypt libmcrypt-devel \
    && pecl install mcrypt \
    && echo "extension=mcrypt" > /etc/php.d/50-mcrypt.ini

# install phan
# RUN yum install -y  php-pecl-xdebug
# RUN yum install -y  composer
# RUN yum install -y  php-ast php-sqlite3 php-pdo
# RUN yum install -y  phan

# 日本語環境設定
ENV LANG ja_JP.utf8
ENV LC_ALL ja_JP.utf8
# Timezone
RUN mv /etc/localtime /etc/localtime.org && \
    ln -s /usr/share/zoneinfo/Japan /etc/localtime

WORKDIR /

# 作業ファイル削除
RUN rm -rf /usr/local/src/* ; yum clean all

# httpd サービスの自動起動設定
RUN systemctl enable httpd.service

# 初期処理起動shを埋め込む
COPY ./docker-entrypoint.sh  /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80
# CMD ["/bin/bash"]
CMD ["/usr/sbin/init"]

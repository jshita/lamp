FROM centos:7

# EPEL:Extra Packages for Enterprise Linux リポジトリを利用
# CentOSでは標準リポジトリが提供しないパッケージが多いのでEPELを利用する。
RUN yum install -y epel-release

# Remi リポジトリを追加
RUN yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# PHP 7 を REMI リポジトリからインストール
#  php          : PHP本体
#  php-devel    : PHPの拡張パッケージの導入に必要
#  php-mbstring : PHPでマルチバイト文字列を利用するのに必要
#  php-pdo      : PDOを利用するのに必要
#  php-gd       : 画像ファイル操作に必要
#  php-mysql    : MySQLを利用するのに必要
RUN yum install -y --enablerepo=remi-php72 php php-devel php-mbstring php-pdo php-gd php-mysql


# https 接続のための設定
RUN yum install -y mod_ssl openssl
COPY ./openssl/ca.crt /etc/pki/tls/certs
COPY ./openssl/ca.key /etc/pki/tls/private/ca.key
COPY ./openssl/ca.csr /etc/pki/tls/private/ca.csr

# Apache が permission denied にならないように最初にユーザ設定を行う
RUN usermod -u 1000 apache && groupmod -g 1000 apache

# メール（gmailリレーで送信のみ）
RUN yum install -y postfix rsyslog cyrus-sasl-plain
COPY ./main.cf /etc/postfix/main.cf
# メール送信用コマンドのインストール
RUN yum install -y sendmail mailx

# ホストにある php.ini と httpd.conf をコンテナ内にコピー
COPY ./php.ini /etc/php.ini
COPY ./httpd.conf /etc/httpd/conf/httpd.conf

# postfix 設定
RUN echo '[smtp.gmail.com]:587 bp.jshita@gmail.com:nkzadtbpxdqpnkua' >> /etc/postfix/relay_password
RUN postmap /etc/postfix/relay_password

# 公開領域ディレクトリを作成
RUN mkdir -p /application

COPY ./run.sh /run.sh
CMD /run.sh

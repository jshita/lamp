FROM mariadb:10.3

#
# MySQLサーバーの設定
#
ENV MYSQL_ROOT_PASSWORD="root" \
    MYSQL_DATABASE="app" \
    MYSQL_USER="docker" \
    MYSQL_PASSWORD="docker"

#
# コンテナ生成後に自動実行する SQL を配置
#
COPY ./sql/ /docker-entrypoint-initdb.d/


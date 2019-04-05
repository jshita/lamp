export `cat .env | grep -v ^# | xargs`

sudo docker exec ${PHP_NAME} /usr/sbin/httpd -k graceful

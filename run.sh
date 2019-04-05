export `cat .env | grep -v ^# | xargs`

sudo docker exec ${PHP_NAME} /usr/bin/systemctl start postfix &
sudo docker exec ${PHP_NAME} /usr/bin/systemctl enable postfix
sudo docker exec ${PHP_NAME} /usr/sbin/httpd

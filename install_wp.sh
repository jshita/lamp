curl -O "https://ja.wordpress.org/wordpress-4.9.8-ja.tar.gz"
mv wordpress-4.9.8-ja.tar.gz wordpress.tar.gz
tar -zxvf wordpress.tar.gz
rm application/public/index.php
mv wordpress/* application/public/
rmdir wordpress
rm wordpress.tar.gz

#!/bin/sh
cd /root
yum -y install wget
wget http://imysql.com/wp-content/uploads/2014/09/tpcc-mysql-src.tgz
gunzip tpcc-mysql-src.tgz
tar xf tpcc-mysql-src.tar
cd tpcc-mysql/src
yum -y install gcc gcc-c++ gcc-g77 flex bison autoconf automake bzip2-devel zlib-devel ncurses-devel libjpeg-devel libpng-devel libtiff-devel freetype-devel pam-devel openssl-devel libxml2-devel gettext-devel pcre-devel
yum install -y gnuplot
yum install -y mysql
yum install -y mysql-devel
wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum install -y mysql-community-server
service mysql restart
cd tpcc-mysql/src
make
cd /root/tpcc-mysql
mysqladmin -uroot create tpcc1000
mysql -uroot -f tpcc1000 < create_table.sql
mysql -uroot tpcc1000 < add_fkey_idx.sql
./tpcc_load localhost tpcc1000 root "" 150
./tpcc_start -hlocalhost -d tpcc1000 -u root -w 150 -c 24 -r 300 -l 1800 - >tpcc-output-log
wget http://lllll.ga/tpcc-output-analyze.sh
chmod +x tpcc-output-analyze.sh
./tpcc-output-analyze.sh tpcc-output-log > tpcc-graphic-data.txt
wget http://lllll.ga/log.conf
cat log.conf | gnuplot
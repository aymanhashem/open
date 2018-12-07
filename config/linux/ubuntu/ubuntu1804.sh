apt-get update
apt-get upgrade -y
#others

if ! [ -x "$(command -v sudo)" ]
    then 
      apt-get install php7.2 php7.2-bcmath php7.2-bz2 php7.2-cgi php7.2-cli php7.2-common php7.2-curl php7.2-dba php7.2-enchant php7.2-fpm php7.2-gd php7.2-gmp php7.2-imap php7.2-interbase php7.2-intl php7.2-json php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-odbc php7.2-opcache php7.2-pgsql php7.2-phpdbg php7.2-pspell php7.2-readline php7.2-recode php7.2-snmp php7.2-soap php7.2-sqlite3 php7.2-tidy php7.2-xml php7.2-xsl php7.2-zip php-redis php-igbinary php7.2-mysql perl tar curl nodejs npm mysql-client python python-pip imagemagick libapache2-mod-php7.2 git composer vim -y
else	    
  echo "hello"    	    
fi

 git clone https://github.com/openemr/openemr.git --depth 1 
 rm -rf openemr/.git
 cd openemr 
 composer install 
 npm install --unsafe-perm 
 npm run build 
 composer global require phing/phing 
 composer global require phing/phing 
  #/root/.composer/vendor/bin/phing vendor-clean \
  #/root/.composer/vendor/bin/phing assets-clean \
 composer global remove phing/phing 
 composer dump-autoload -o 
 composer clearcache 
 npm cache clear --force 
 rm -fr node_modules 
 cd ../ 
 chmod 666 openemr/sites/default/sqlconf.php 
 chmod 666 openemr/interface/modules/zend_modules/config/application.config.php 
 chown -R www-data openemr/ 
 mv openemr /var/www/ 

 #php.ini
 #openemr.conf
 #run_opneemrsh
# remove default site in sites-enabled
# remove /var/www/html*

### SSL
git clone https://github.com/letsencrypt/letsencrypt /opt/certbot 
pip install -e /opt/certbot/acme -e /opt/certbot 
 
openssl req -x509 -newkey rsa:4096 \
-keyout /etc/ssl/private/selfsigned.key.pem \
-out /etc/ssl/certs/selfsigned.cert.pem \
-days 1065 -nodes \
-subj "/C=xx/ST=x/L=x/O=x/OU=x/CN=localhost"

#rm -f /etc/ssl/certs/webserver.cert.pem
#rm -f /etc/ssl/private/webserver.key.pem
#ln -s /etc/ssl/certs/selfsigned.cert.pem /etc/ssl/certs/webserver.cert.pem
#ln -s /etc/ssl/private/selfsigned.key.pem /etc/ssl/private/webserver.key.pem

### Config Files
rm -f /etc/apache2/apache2.conf
rm -f /etc/apache2/conf-enabled/security.conf
rm -f /etc/apache2/sites-enabled/000-default.conf
cp /config/linux/ubuntu/apache/apache2.conf /etc/apache2/
cp /config/linux/ubuntu/apache/openemr.conf /etc/apache2/sites-enabled
cp /config/linux/ubuntu/apache/security.conf /etc/apache2/conf-enabled

### Load Mods...
ln -s /etc/apache2/mods-available/socache_smcb.load /etc/apache2/mods-avaibled/socache_smcb.load 
ln -s /etc/apache2/mods-available/ssl.conf /etc/apache2/mods-enabled/ssl.conf
ln -s ssl.load /etc/apache2/mods-available/ssl.load /etc/apache2/mods-enabled/ssl.load
ln -s /etc/apache2/mods-available/rewrite.conf /etc/apache2/mods-enabled/rewrite.conf

### More File Permissions
echo "Default file permissions and ownership set, allowing writing to specific directories"
chmod 700 run_openemr.sh
# Set file and directory permissions
chmod 600 interface/modules/zend_modules/config/application.config.php
find sites/default/documents -type d -print0 | xargs -0 chmod 700
find sites/default/edi -type d -print0 | xargs -0 chmod 700
find sites/default/era -type d -print0 | xargs -0 chmod 700
find sites/default/letter_templates -type d -print0 | xargs -0 chmod 700
find interface/main/calendar/modules/PostCalendar/pntemplates/cache -type d -print0 | xargs -0 chmod 700
find interface/main/calendar/modules/PostCalendar/pntemplates/compiled -type d -print0 | xargs -0 chmod 700
find gacl/admin/templates_c -type d -print0 | xargs -0 chmod 700

### Script Removal
echo "Removing remaining setup scripts"
#remove all setup scripts
rm -f admin.php
rm -f acl_setup.php
rm -f acl_upgrade.php
rm -f setup.php
rm -f sql_patch.php
rm -f sql_upgrade.php
rm -f ippf_upgrade.php
rm -f gacl/setup.php
echo "Setup scripts removed, we should be ready to go now!"

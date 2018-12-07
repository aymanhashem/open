if ! [ -x "$(command -v sudo)" ]
    then 
      apt-get install php7.2 php7.2-bcmath php7.2-bz2 php7.2-cgi php7.2-cli php7.2-common php7.2-curl php7.2-dba php7.2-dev php7.2-enchant php7.2-fpm php7.2-gd php7.2-gmp php7.2-imap php7.2-interbase php7.2-intl php7.2-json php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-odbc php7.2-opcache php7.2-pgsql php7.2-phpdbg php7.2-pspell php7.2-readline php7.2-recode php7.2-snmp php7.2-soap php7.2-sqlite3 php7.2-tidy php7.2-xml php7.2-xsl php7.2-zip php-redis php-igbinary php7.2-mysql perl tar curl nodejs npm mysql-client python python-pip imagemagick libapache2-mod-php7.2 git composer vim -y
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
 chmod 666 openemr/sites/default/sqlconf.php \
 chmod 666 openemr/interface/modules/zend_modules/config/application.config.php \
 chown -R apache openemr/ \
 mv openemr /var/www/ \
 git clone https://github.com/letsencrypt/letsencrypt /opt/certbot \
 pip install -e /opt/certbot/acme -e /opt/certbot \
 mkdir -p /etc/ssl/certs /etc/ssl/private \

 #php.ini
 #openemr.conf
 #run_opneemrsh


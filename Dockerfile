FROM ubuntu:16.04

#Baixar arquivos necessários para o Team  pass
RUN apt-get update && apt-get install -y \
unzip \
vim \
wget \
curl \
apache2 \
php \
libapache2-mod-php \
php-mcrypt php-mysql \
php-opcache \
php-mbstring \
php-ldap \
php-bcmath \
php-gd \
php-xml \
php-common \
php-mysqlnd \
php-curl

#Baixar o TeamPass do GitHub e efetuar tratativa
RUN cd /var/www/html && \
wget https://github.com/nilsteampassnet/TeamPass/archive/2.1.26.zip && unzip 2.1.26.zip && \ 
mv TeamPass-2.1.26 teampass && \ 
chown -R www-data:www-data teampass/


#Alterar o timeout do PHP para 120
RUN sed -i 's/max_execution_time = 30/max_execution_time =120/g' /etc/php/7.0/apache2/php.ini

RUN mkdir -p /var/www/html/teampass/keys &&\
chmod 755 /var/www/html/teampass/keys &&\ 
chown -R www-data:www-data /var/www/html/teampass/keys

CMD /usr/sbin/apache2ctl -D FOREGROUND

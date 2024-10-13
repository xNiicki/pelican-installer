#!/bin/sh


apt update
apt install software-properties-common lsb-release apt-transport-https ca-certificates net-tools sudo -y
sudo su
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt update

apt install php8.3
apt install php8.3-gd php8.3-mysql php8.3-mbstring php8.3-bcmath php8.3-xml php8.3-curl php8.3-zip php8.3-intl php8.3-sqlite3 php8.3-fpm -y


mkdir -p /var/www/pelican
cd /var/www/pelican

curl -L https://github.com/pelican-dev/panel/releases/latest/download/panel.tar.gz |  tar -xzv

touch /var/www/pelican/database/database.sqlite

chown -R www-data:www-data /var/www/pelican

curl -sS https://getcomposer.org/installer |  php -- --install-dir=/usr/local/bin --filename=composer
composer install --no-dev --optimize-autoloader

systemctl stop apache2

apt install nginx -y
rm /etc/nginx/sites-enabled/default

ip_address=$(hostname -I | awk '{print $1}')

echo '
server {
    listen 80;
    server_name $ip_address;


    root /var/www/pelican/public;
    index index.html index.htm index.php;
    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log off;
    error_log  /var/log/nginx/pelican.app-error.log error;

    # allow larger file uploads and longer script runtimes
    client_max_body_size 100m;
    client_body_timeout 120s;

    sendfile off;

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/run/php/php8.3-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param PHP_VALUE "upload_max_filesize = 100M \n post_max_size=100M";
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param HTTP_PROXY "";
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
    }

    location ~ /\.ht {
        deny all;
    }
}'  | sed "s/\$ip_address/$(hostname -I | awk '{print $1}')/" > /etc/nginx/sites-available/pelican.conf


 ln -s /etc/nginx/sites-available/pelican.conf /etc/nginx/sites-enabled/pelican.conf

 systemctl restart nginx


php artisan migrate
php artisan config:clear
php artisan cache:clear
echo "ip = $ip_address"
php artisan p:environment:setup

chmod -R 755 storage/* bootstrap/cache/
chown -R www-data:www-data /var/www/pelican

# The cron job to add
cronjob="* * * * * php /var/www/pelican/artisan schedule:run >> /dev/null 2>&1"

# Add the new cron job to the existing crontab for www-data
( crontab -u www-data -l 2>/dev/null; echo "$cronjob") |  crontab -u www-data -

 php artisan p:environment:queue-service


echo "Pelican Panel has been installed successfully!"
echo "You can access your panel at http://$ip_address/installer"


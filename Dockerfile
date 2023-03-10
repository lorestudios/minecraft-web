FROM php:8.1-apache

ENV APACHE_DOCUMENT_ROOT /var/www/html/faweupload

COPY . /var/www/html/faweupload

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN chown -R www-data:www-data /var/www/
USER www-data

EXPOSE 80

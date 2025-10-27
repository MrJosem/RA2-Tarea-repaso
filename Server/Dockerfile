# Imagen base de Ubuntu
FROM ubuntu:22.04

# Evita prompts interactivos
ENV DEBIAN_FRONTEND=noninteractive

# Instala Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expone el puerto 80 dentro del contenedor
EXPOSE 80

# Copia los archivos necesarios al contenedor desde el host
COPY otro_vh_html/ /var/www/html/otro
COPY apache2_conf/ /etc/apache2
COPY vh_conf/ /etc/apache2/sites-available
COPY ca.cer /etc/ssl/certs/ca.cer
COPY joseapache.work.gd.key /etc/ssl/private/joseapache.work.gd.key
COPY joseapache.work.gd.cer /etc/ssl/certs/joseapache.work.gd.cer

# Habilita el segundo host-virtual
RUN a2ensite otro-default.conf
RUN a2ensite my-ssl.conf
RUN a2enmod ssl

# Comando para mantener Apache corriendo en primer plano
CMD ["usr/sbin/apachectl", "-D", "FOREGROUND"]

#!/bin/bash
# Instalación Docker
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io -y

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clona el repositorio
sudo apt install git -y
sudo git clone https://github.com/MrJosem/RA2-Tarea-repaso.git /tmp/mi_repo

# Copia todos los archivos que se montarán en los volúmenes del contenedor
sudo cp -r /tmp/mi_repo/Server/* /home/admin
sudo rm -rf /tmp/mi_repo

sudo systemctl enable docker
sudo systemctl start docker

# Copia los archivos a carpetas preparadas para montar en los volúmenes
cd /home/admin
sudo mkdir otro_vh_html
sudo cp index.html.en otro_vh_html
sudo cp index.html.es otro_vh_html
sudo cp index.var otro_vh_html

sudo mkdir vh_conf
sudo cp otro-default.conf vh_conf
sudo cp 000-default.conf vh_conf

sudo mkdir apache2_conf
sudo cp apache2.conf apache2_conf


# Dockerfile
touch Dockerfile

echo -e "FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
EXPOSE 80
COPY otro_vh_html/ /var/www/html/otro
COPY apache2_conf/ /etc/apache2
COPY vh_conf/ /etc/apache2/sites-available
RUN a2ensite otro-default.conf
CMD ["apachectl", "-D", "FOREGROUND"]" > Dockerfile

# Monta el contenedor
sudo docker build -t ubuntu-apache .
sudo docker run -d -p 8080:80 --name my-apache ubuntu-apache
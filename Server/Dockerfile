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

# Comando para mantener Apache corriendo en primer plano
CMD ["apachectl", "-D", "FOREGROUND"]

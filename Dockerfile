# Use a imagem oficial do Ubuntu 20.04
FROM ubuntu:20.04

# Evite problemas com diálogos frontend
ENV DEBIAN_FRONTEND=noninteractive

# Adicione o repositório ondrej/php
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:ondrej/php

# Instale o PHP 5.6 e as extensões necessárias
RUN apt-get update && apt-get install -y \
    apache2 \
    php5.6 \
    php5.6-mysql \
    php5.6-pdo \
    libapache2-mod-php5.6

# Copie os arquivos da sua aplicação para o diretório do Apache
COPY . /var/www/html/

# Defina o diretório de trabalho
WORKDIR /var/www/html

# Habilite o mod_rewrite do Apache
RUN a2enmod rewrite

# Altere as permissões do diretório /var/www/html/
RUN chown -R www-data:www-data /var/www/html/ && a2enmod rewrite

# Exponha a porta 80 (padrão do Apache)
EXPOSE 80

# Comando para iniciar o Apache
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
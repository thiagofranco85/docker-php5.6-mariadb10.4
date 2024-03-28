# Use a imagem oficial do PHP com a versão desejada (no caso, PHP 5.6)
FROM php:5.6-apache

# Instale as extensões PHP necessárias (se houver)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copie os arquivos da sua aplicação para o diretório do Apache
COPY . /var/www/html/

# Defina o diretório de trabalho
WORKDIR /var/www/html

# Exponha a porta 80 (padrão do Apache)
EXPOSE 80

# Comando para iniciar o Apache
CMD ["apache2-foreground"]

#!/bin/bash

#Esto muestra todos los comandos que se van ejecutando
set -x 
#Actualizamos los repositorios
apt update

#Actualizamos los paquetes de la máquina 

#apt upgrade -y

#Importamos el archivo de variables .env

source .env

#Creamos un certificado y una clave primaria.

openssl req \
  -x509 \
  -nodes \
  -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/ssl/private/apache-selfsigned.key \
  -out /etc/ssl/certs/apache-selfsigned.crt \
  -subj "/C=$OPENSSL_COUNTRY/ST=$OPENSSL_PROVINCE/L=$OPENSSL_LOCALITY/O=$OPENSSL_ORGANIZATION/OU=$OPENSSL_ORGUNIT/CN=$OPENSSL_COMMON_NAME/emailAddress=$OPENSSL_EMAIL"

# Copiamos el archivo de configuración de Apache para HTTPS.

cp ../conf/default-ssl.conf /etc/apache2/sites-available/ 

#Habilitamos el VirtualHost para HTTPS. (paso2)

a2ensite default-ssl.conf

#Habilitamos el múdulo SSL-TLS (Paso3)

a2enmod ssl


#Configuramos que las peticiones que se hacen a HTTP se redirijan a HTTPS.
# Copiamos el archivo de configuracion de VirtualHost para HTTP

cp ../conf/000-default.conf /etc/apache2/sites-available

#Habilitamos el modulo de ReWrite

a2enmod rewrite

#Reiniciamos el servicio de apache

systemctl restart apache2






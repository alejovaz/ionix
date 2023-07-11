#!/bin/sh
# Reemplaza el proxy_pass y name_server con la env var $BACKEND_URL
echo "Reemplazando name_server y proxy_pass por $BACKEND_URL"
sed -i 's/proxy_pass http.*/proxy_pass http:\/\/'$BACKEND_URL';/g' default.conf
sed -i 's/server_name .*/server_name '$BACKEND_URL';/g' default.conf
# Crea el certificado SSL usando como CommonName la env var $BACKEND_URL y sin preguntas
echo "Creando certificado autofirmado para $BACKEND_URL"
openssl req -newkey rsa:4096 \
-x509 \
-sha256 \
-days 3650 \
-nodes \
-out nginx.crt \
-keyout nginx.key \
-subj "/C=CL/ST=Region Metropolitana/L=Santiago/O=IONIX/OU=IT Department/CN=$BACKEND_URL"
# # Construye imagen con la especificación del Dockerfile
echo "Construyendo imagen de Docker"
docker build -t simple-nginx .
# # Ejecuta el contenedor
echo "Ejecutando el container de Docker"
docker run -e -it -p 80:80 -p 443:443 --rm --name simple-nginx-running-app simple-nginx
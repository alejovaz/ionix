#!/bin/sh

# IMPORTANTE: Se asume que la BD es existente y que se tiene la herramienta "mysqldump" y "bzcat" instaladas en el sistema.
# MAS IMPORTANTE: Si quiere puede definir las variables de ambiente en el archivo .env y cargarlas en el env ejecutando: "source .env"

echo "¿Tiene las variables de ambiente definidas? Si escoje \"N\" se le pedirá ingresarlas por teclado"
read VARS

if [ $VARS = "N" ] || [ $VARS = "n" ]; then

    # Ingreso de variables de ambiente

    echo "Introduzca Usuario: "
    read DB_USER
    echo "Introduzca Password: "
    read DB_PASS
    echo "Instroduzca el nombre de la BD: "
    read DB_NAME
    echo "Introduzca el host: "
    read DB_HOST
    echo "Instroduzca el puerto: "
    read DB_PORT

    # Exporta vars a environment

    export DB_USER=$DB_USER
    export DB_PASS=$DB_PASS
    export DB_NAME=$DB_NAME
    export DB_PORT=$DB_PORT
    export DB_HOST=$DB_HOST

fi

# Informa y ejecuta el dump de la BD

echo "\nSe respalda la DB: "$DB_NAME" por el usuario: "$DB_USER 
echo "en el host: "$DB_HOST" por el puerto: "$DB_PORT" en el archivo dump.bz2\n"

mysqldump -u$DB_USER -p$DB_PASS -h$DB_HOST -P$DB_PORT $DB_NAME --protocol=tcp | bzip2 > dump.bz2

echo "\n¿Quiere ver el contenido del respaldo por consola? Y/N\n"
read SiNo

if [ $SiNo = "Y" ] || [ $SiNo = "y" ]; then
    bzcat dump.bz2
else 
    echo "Gracias por usar el script de respaldo de mysql"
fi
Ejecute el archivo "reemp.sh" este se encarga de:
1. Hacer el reemplazo de la env var $BACKEND_URL en los archivos de configuración
2. Crear los certificados autofirmados para la $BACKEND_URL
3. Crear la imagen de docer con el Dockerfile
4. Ejecutar el container de Docker

Prerequisitos:

- Tener docker y openssl instalado localmente
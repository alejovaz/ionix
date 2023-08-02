**2.1 Nginx reverse proxy**
Crea una imagen de Docker, basada en Nginx, que reciba una URL como variable de ambiente y haga un proxy reverso a dicha URL.
**Criterios:**
La imagen de docker debe estar basada en Nginx
Debe ocupar la variable de ambiente BACKEND_URL para definir a dónde apunta el proxy reverso.
Todos los request que le lleguen a este Nginx deber ser pasador por proxy_pass a la URL objetivo.
Debe admitir HTTPS. Los requests que lleguen por HTTP deben ser redirigidos al cliente a HTTPS.
El certificado a usar para HTTPS debe ser autofirmado, y se puede generar en cualquier momento (en la imagen de docker, cuando corre el
container, de ante mano, etc)
Si el backend no existe o retorna error, usar la configuración por defecto de Nginx.

**Ejecución:**

Ejecute el archivo "reemp.sh" este se encarga de:
1. Hacer el reemplazo de la env var $BACKEND_URL en los archivos de configuración
2. Crear los certificados autofirmados para la $BACKEND_URL
3. Crear la imagen de docer con el Dockerfile
4. Ejecutar el container de Docker

Prerequisitos:

- Tener docker y openssl instalado localmente

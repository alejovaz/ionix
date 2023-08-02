**2.2 Helm deployment**
Crea un chart con el comando de creación de Helm helm create y despliega una imagen de Nginx con una página HTML estática.
**Criterios:**
El documento HTML puede ser cualquier contenido en un solo archivo index.html. Un hola mundo es suficiente.
El contenido de index.html debe estar embebido dentro del archivo values.yaml.
El archivo index.html debe ser montado al container usando un configMap.
El pod debe ser stateless
No hay requisitos para ingress

**Ejecución:**
Este chart despliega un container nginx con "Hola Mundo" usando values.yaml y configMap.
El service fue desplegado con NodePort en el puerto externo 30080

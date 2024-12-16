# Usa una imagen oficial de Nginx
FROM nginx:alpine

# Copia el archivo HTML en el contenedor
COPY pageweb.html /usr/share/nginx/html/index.html

# Expone el puerto 80 (puerto predeterminado para HTTP)
EXPOSE 80
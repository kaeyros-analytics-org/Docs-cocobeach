FROM nginx:alpine

# Supprime les fichiers par défaut de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copie ton site dans le dossier public de Nginx
COPY _build/html/ /usr/share/nginx/html/

# Nginx expose par défaut le port 80
EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]

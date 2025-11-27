# # ------------- Base image Python -------------
# FROM python:3.12-slim

# # ------------- Install Sphinx + themes -------------
# # RUN pip install --no-cache-dir sphinx sphinx-rtd-theme myst-parser

# # ------------- Copy the Sphinx project -------------
# WORKDIR /docs
# COPY . /docs

# # ------------- Build HTML -------------
# # RUN sphinx-build -b html . _build/html

# # ------------- Serve with Nginx -------------
# FROM nginx:alpine
# COPY --from=0 /docs/_build/html /usr/share/nginx/html
# Utilise Nginx comme serveur web
FROM nginx:alpine

# Supprime les fichiers par défaut de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copie ton site dans le dossier public de Nginx
COPY _build/html/ /usr/share/nginx/html/

# Nginx expose par défaut le port 80
EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]

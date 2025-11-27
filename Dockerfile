# ------------- Base image Python -------------
FROM python:3.12-slim

# ------------- Install Sphinx + themes -------------
RUN pip install --no-cache-dir sphinx sphinx-rtd-theme myst-parser

# ------------- Copy the Sphinx project -------------
WORKDIR /docs
COPY . /docs

# ------------- Build HTML -------------
RUN sphinx-build -b html . _build/html

# ------------- Serve with Nginx -------------
FROM nginx:alpine
COPY --from=0 /docs/_build/html /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

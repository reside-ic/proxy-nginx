FROM nginx:stable

# Only used for generating self-signed certificates
RUN apt-get update && apt-get install -y openssl

# Clear out existing configuration
RUN rm /etc/nginx/conf.d/default.conf

VOLUME /var/log/nginx
VOLUME /run/proxy

COPY nginx.conf /etc/nginx/nginx.conf.template
COPY bin /usr/local/bin
COPY ssl /usr/local/share/ssl

ENTRYPOINT ["/usr/local/bin/reverse-proxy"]

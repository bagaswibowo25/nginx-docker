FROM alpine
RUN apk update && apk add nginx curl
RUN mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx/
COPY docker-startup.sh /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/
WORKDIR /usr/share/nginx/html
COPY index.html .
RUN chmod +x docker-startup.sh
CMD ./docker-startup.sh
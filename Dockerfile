FROM alpine
RUN apk update && apk add nginx
RUN mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx/
COPY docker-startup.sh /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html
RUN chmod +x docker-startup.sh
CMD ./docker-startup.sh

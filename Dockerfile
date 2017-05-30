FROM alpine:latest

ENV host=127.0.0.1

RUN apk update && \
    apk add nginx ca-certificates wget openssl && \
    update-ca-certificates
RUN mkdir /run/nginx

COPY default.conf /etc/nginx/conf.d/default.conf

COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 80

CMD ["/start.sh"]

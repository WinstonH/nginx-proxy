FROM alpine:latest

ENV host www.baidu.com

RUN apk update && \
    apk add ca-certificates wget openssl && \
    update-ca-certificates
RUN wget -N --no-check-certificate https://softs.pw/Bash/caddy_install.sh && chmod +x caddy_install.sh && sh caddy_install.sh

COPY start.sh /start.sh
RUN chmod +x /start.sh /usr/local/caddy/caddy
EXPOSE 80

CMD ["/start.sh"]

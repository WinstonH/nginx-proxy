FROM alpine:latest

ENV host 'www.baidu.com'
ENV TZ 'Asia/Shanghai'

RUN apk upgrade --no-cache && \
    apk add --no-cache bash tzdata ca-certificates openssl && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    rm -rf /var/cache/apk/* && \
    update-ca-certificates

COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

FROM alpine:latest

ENV host www.baidu.com

RUN apk add --no-cache --virtual build-dependencies build-base wget gcc make
RUN wget --no-check-certificate http://www.boutell.com/rinetd/http/rinetd.tar.gz && \
    tar zxvf rinetd.tar.gz && \
    touch /etc/rinetd.conf && \
    cd rinetd && \  
    mkdir -p /usr/man/man8  && \ 
    make && make install
    
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 80

ENTRYPOINT ["/start.sh"]

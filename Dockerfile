FROM alpine:latest

RUN apk update && \
    apk add wget gcc make
RUN wget http://www.boutell.com/rinetd/http/rinetd.tar.gz && \
    tar zxvf rinetd.tar.gz && \
    touch /etc/rinetd.conf && \
    cd rinetd && \  
    mkdir -p /usr/man/man8  && \ 
    make && make install
    
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 80

CMD ["/start.sh"]

FROM ubuntu:14.04

ENV host=www.baidu.com

RUN apt-get update && \
    apt-get install -y wget gcc make
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
CMD ["/usr/sbin/rinetd","-c","/etc/rinetd.conf"]

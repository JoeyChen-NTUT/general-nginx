FROM nginx:latest

RUN apt clean
RUN apt update
RUN apt install -y wget

VOLUME ["/etc/nginx"]

COPY perfect-forward-secrecy.conf /etc/nginx/
sed -i -e '0,/include/!b;//a \ \ \ \ include perfect-forward-secrecy.conf;' nginx.conf

RUN cd /etc/nginx && \
    openssl dhparam -out dh4096.pem 4096

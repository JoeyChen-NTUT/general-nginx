FROM nginx:latest

RUN apt clean
RUN apt update
RUN apt install -y wget

RUN wget -qO /etc/nginx/perfect-forward-secrecy.conf https://raw.githubusercontent.com/JoeyChen-NTUT/general-nginx/master/perfect-forward-secrecy.conf
RUN sed -i -e '/^include /etc/nginx/conf.d/*.conf;/a include perfect-forward-secrecy.conf;' /etc/nginx/nginx.conf

RUN cd /etc/nginx && \
    openssl dhparam -out dh4096.pem 4096


VOLUME ["/etc/nginx/conf.d"]

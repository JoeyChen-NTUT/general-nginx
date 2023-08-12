FROM nginx:stable
#FROM nginx:latest
#20230801 tigger docker image update

RUN export DEBIAN_FRONTEND=noninteractive

RUN apt clean
RUN apt update

VOLUME ["/etc/nginx"]

COPY perfect-forward-secrecy.conf /etc/nginx/
RUN sed -i -e '0,/include/!b;//a \ \ \ \ include perfect-forward-secrecy.conf;' /etc/nginx/nginx.conf

RUN cd /etc/nginx && \
    openssl dhparam -out dh4096.pem 4096

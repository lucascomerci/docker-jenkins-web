FROM ubuntu
MAINTAINER Apasoft Training "apasoft.training@gmail.com"
# Variables del proxy
ENV http_proxy=http://lmcomerci:pgzz87@10.20.1.50:8080
ENV https_proxy=http://lmcomerci:pgzz87@10.20.1.50:8080
ENV ftp_proxy=http://lmcomerci:pgzz87@10.20.1.50:8080
ENV no_proxy=localhost,127.0.0.1

# Configuración del proxy para APT
RUN echo 'Acquire::http::Proxy "http://lmcomerci:pgzz87@10.20.1.50:8080";' >> /etc/apt/apt.conf.d/01proxy
# Esto estaba en el Dockerfile

RUN apt-get update
RUN apt-get install -y nginx
ADD web /var/www/html/
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80

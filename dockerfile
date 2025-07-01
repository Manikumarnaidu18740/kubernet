FROM almalinux:8
LABEL maintainer="manikumarnaidu18704@gmail.com"

RUN dnf install -y httpd unzip zip && dnf clean all

# Add a working direct zip download (see below)
ADD https://github.com/vaibhaw1908/files/raw/main/photogenic-master.zip /var/www/html/

WORKDIR /var/www/html/

RUN unzip photogenic-master.zip && \
    cp -rvf photogenic-master/* . && \
    rm -rf photogenic-master photogenic-master.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80 443

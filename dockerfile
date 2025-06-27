FROM centos:7

MAINTAINER manikumarnaidu18740@gmail.com

# Install required packages
RUN yum install -y httpd zip unzip && \
    yum clean all

# Download the zip template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Unzip and prepare the content
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start Apache server in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose HTTP port
EXPOSE 80 443

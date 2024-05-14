FROM amazonlinux:latest
RUN yum update -y && \
    yum install -y httpd && \
    yum search wget && \
    yum install wget -y && \
    yum install unzip -y
RUN cd /var/www/html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page293/chocolux.zip 
RUN unzip chocolux.zip
RUN cp -r chocolux-html/* /var/www/html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

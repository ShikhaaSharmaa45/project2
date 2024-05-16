FROM amazonlinux:latest
RUN yum update -y && \
    yum install -y httpd && \
    yum search wget && \
    yum install wget -y && \
    yum install unzip -y
RUN cd /var/www/html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/klinik.zip
RUN unzip klinik.zip
RUN cp -r clinic-website-template/* /var/www/html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

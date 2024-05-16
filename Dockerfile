FROM amazonlinux:latest
RUN yum update -y && \
    yum install -y httpd && \
    yum search wget && \
    yum install wget -y && \
    yum install unzip -y
RUN cd /var/www/html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/listrace.zip 
RUN unzip listrace.zip
RUN cp -r listrace-v1.0/* /var/www/html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

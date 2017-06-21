# Centos based container with httpd service 
FROM centos:centos7
MAINTAINER kushal.singh

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum -y install git && \
    yum clean all
#Create directory to serve static conetent

#RUN mkdir  /var/www/
#RUN mkdir  /var/www/html
ADD git clone https://github.com/kushal-sngh/lumosity.git /
RUN cp -r /lumosity/static-content/* /var/www/html
RUN rm -rf /lumosity

ADD startHttpd.sh /startHttpd.sh
RUN chmod +x /startHttpd.sh


EXPOSE 80

#USER tomcat
CMD ["/startHttpd.sh"]

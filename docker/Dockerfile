# Centos based container with Java and Tomcat
FROM centos:centos7
MAINTAINER kushal.singh

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all
#Create directory to serve static conetent

RUN mkdir -p /var/www/html
ADD $(pwd)/lumosity/static-content/*.* /var/www/html

ADD startHttpd.sh /startHttpd.sh
RUN chmod +x /startHttpd.sh


EXPOSE 80

#USER tomcat
CMD ["/startHttpd.sh"]

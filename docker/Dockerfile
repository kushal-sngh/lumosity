# Centos based container with httpd service 
FROM centos:centos7
MAINTAINER kushal.singh

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum -y install git && \
    yum clean all
#Create directory to serve static conetent

#RUN mkdir  /var/www/html
#COPY static content
RUN git clone https://github.com/kushal-sngh/lumosity.git
RUN cp -r /lumosity/static-content/* /var/www/html
RUN cp /lumosity/docker/*.sh /usr/local/bin
RUN chmod +x /usr/local/bin/startHttpd.sh
RUN rm -rf /lumosity

EXPOSE 80

CMD ["/usr/local/bin/startHttpd.sh"]

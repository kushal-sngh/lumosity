# Centos based oauth container 
FROM centos:centos7
MAINTAINER kushal.singh

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y install wget && \
    yum -y install git && \
    yum clean all

#RUN rm -rf /lumosity
RUN git clone https://github.com/kushal-sngh/lumosity.git
RUN chmod +x lumosity/*.sh
RUN /lumosity/install_golang.sh
RUN cp /lumosity/install_oauth2.sh /usr/local/bin
RUN rm -rf /lumosity

EXPOSE 4180

CMD ["/usr/local/bin/install_oauth2.sh"]

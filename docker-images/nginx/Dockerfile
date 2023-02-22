FROM centos:7

LABEL version="1.0"
LABEL maintainer="Mahesh"

# To set the class path
# ENV JAVA_HOME="JAVA_LOCATION"

COPY nginx.repo /etc/yum/repos.d/nginx.repo

RUN yum clean all
RUN yum -y install nginx

EXPOSE 80
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
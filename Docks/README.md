##### To build the the centos:7 container using the dockerfile.
```
$ mkdir docker

$ vi docker/dockerfile
FROM centos:7
RUN yum update -y
RUN yum -y install wget

syntax: docker image build -t ImageName:TagName dockerfile-dir

$ docker image build -t centos7:test docker
```
##### To build the the Nginx container using the dockerfile.
```
$ mkdir nginx

$ vim nginx/nginx.repo

[nginx]
name=nginx repo
baseurl=https://nginx.org/packages/centos/$releasever/$basearch
gpgcheck=0
enabled=1
sslverify=false

$ vim nginx/dockerfile

FROM centos:7

LABEL version="1.0"
LABEL maintainer="Mahesh"

ENV ENVIRONMENT TEST

COPY nginx.repo /etc/yum/repos.d/nginx.repo

RUN yum clean all
RUN yum -y install nginx
#RUN systemctl --now enable nginx

EXPOSE 8080
CMD ["/usr/sbin/init"]
$ docker build -t nginx:test nginx
```

##### To build the the custom centos:7 Image using the dockerfile.
```
$ mkdir docker

$ vi docker/dockerfile
FROM centos:7
RUN yum update -y
RUN yum -y install wget

syntax: docker image build -t ImageName:TagName dockerfile-dir

$ docker image build -t centos7:test docker
```
##### To build the the custom Nginx Image using the dockerfile.
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
#CMD ["/usr/sbin/init"]
CMD ["nginx", "-g", "deamon off";

$ docker image build -t nginx:myorg nginx

To build a container from the custom image

$ docker run -d nginx:testenv -p 8080:80

$ curl http://localhost:8080
```

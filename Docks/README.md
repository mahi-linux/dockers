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

# To set the class path
# ENV JAVA_HOME="JAVA_LOCATION"
# WORKDIR /opt

COPY nginx.repo /etc/yum/repos.d/nginx.repo

RUN yum clean all \
yum -y install nginx

EXPOSE 80
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
# CMD ["sh /script.sh"]

$ docker image build -t myorg:nginx nginx

To build a container from the custom image

$ docker run -d -p 8080:80 myorg:nginx

$ curl http://localhost:8080

** Publish the custom image in docker repository **

$ docker login

$ docker commit "59b4c95829eb"

Change the tagging

$ docker image tag myorg:nginx maheshreddy/nginx

Push the image to the docker repository

$ docker image push maheshreddy/nginx

Verify the image from the https://hub.docker.com/
```

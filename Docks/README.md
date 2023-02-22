##### To build the the custom httpd Image using the dockerfile and publish to the docker hub.
```
$ mkdir httpd

$ vi httpd/dockerfile
FROM centos:7
RUN yum update -y
RUN yum -y install httpd
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

syntax: docker build -t "tags" dockerfile-dir

$ docker build -t httpd .
$ docker login
$ docker image tag httpd maheshreddy/httpd
$ docker images
$ docker image push maheshreddy/httpd
```

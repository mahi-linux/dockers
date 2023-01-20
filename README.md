## dockers cheat-sheet

##### Docker installation on CentOS
```
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce

* To enable and start the docker service
systemctl --now enable  docker
```
##### To display docker version and info
```
$ docker --version
$ docker version
$ docker info
```
##### To search docker image
```
$ docker search centos
```
##### Pull docker images:
```
$ docker pull centos:7
$ docker pull centos # It would always call latest version image
```
##### To list all downloaded or local images
```
$ docker images
```
##### To download docker image and run the container
```
$ docker run hello-world
$ docker run -it centos (or) docker run -it centos bash
```
##### To create and start images
```
$ docker create -it centos
$ docker start -ai "container id"
```
##### To pull/download the docker image and run the apache application on the container.
```
$ docker run -d -p 80:80 --name apache httpd   
Unable to find image 'httpd:latest' locally
latest: Pulling from library/httpd
c229119241af: Pull complete 
1805d911aae4: Pull complete 
e3709b515d9c: Pull complete 
4f53b8f15873: Pull complete 
3b60f356ab85: Pull complete 
Digest: sha256:e3c40b99ffa305c6e52346a6618b1fb47ea0568c999b26f8900cd26febab1160
Status: Downloaded newer image for httpd:latest
5fcf1ba3a5a49bbafcb25cf6cf792dd583eebfa029244007d8b4d4596b1df147

=> This will download latest image if the image is not availabe in local machine. And the container run in background.

=> where the first port is host port and 2nd port is the container port.

=> Verify the webpage status from the web browser http://192.168.10.12/ (or) curl 192.168.10.12

##### dockerfile non-root method
```
# Docker Image Name
FROM httpd:latest

# Switch to the non-root user
RUN groupadd -g 1001 mahesh && useradd -u 1001 -g 1001 mahesh

# Install depency packages for ps command
RUN apt update && apt install -y procps curl && rm -rf /var/lib/apt/lists/*

RUN chown -R mahesh:mahesh /usr/local/apache2/

# EXPOSE 80/TCP # This will not epose to host machine

# Start the Apache httpd service as non-root user
# Since the CMD/ENTRYPOINT already defined at the image level we don't need to define manually
# CMD/ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# CMD '/usr/sbin/httpd -DFOREGROUND &'
# CMD ["httpd-foreground"]

USER mahesh
```
$ docker build .

$ docker image => To Get the Image ID
$ docker run -d -p 80:80 deb900be2e2c(imageid)

```
$ docker ps => To Get the Container ID
CONTAINER ID   IMAGE          COMMAND              CREATED         STATUS         PORTS                NAMES
5228d51fd14b   66a4347a1b16   "httpd-foreground"   3 seconds ago   Up 2 seconds   0.0.0.0:80->80/tcp   eager_snyder

$ docker exec -it 5228d51fd14b bash
mahesh@5228d51fd14b:/usr/local/apache2$ id
uid=1001(mahesh) gid=1001(mahesh) groups=1001(mahesh)

mahesh@5228d51fd14b:/usr/local/apache2$ curl localhost
<html><body><h1>It works!</h1></body></html>

```

```
##### To pull/download the docker image and run the nginx application on the container.
```
$ docker run -d -p 8080:80 --name proxyserver nginx
Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
c229119241af: Already exists 
2215908dc0a2: Pull complete 
08c3cb2073f1: Pull complete 
18f38162c0ce: Pull complete 
10e2168f148a: Pull complete 
c4ffe9532b5f: Pull complete 
Digest: sha256:2275af0f20d71b293916f1958f8497f987b8d8fd8113df54635f2a5915002bf1
Status: Downloaded newer image for nginx:latest
055ed2373fa1e96643c71e8d834aa68655c022947564fedd0afede07dbe951d2

=> Verify the webpage status from the web browser http://192.168.10.12:8080/
```
##### List docker containers (running, all, all in quiet mode)
```
$ docker ps
$ docker ps -a
$ docker container ls
```
##### To see the running processors inside the container
```
$ docker top apache
```
##### To see the container information in a json format
```
$ docker inspect apache
$ docker container inspect apache
```
##### To see the container resource usage
```
$ docker stats apache
$ docker stats 
```
##### To connect to the container (or) ssh to the container
```
$ docker exec -it apache /bin/bash
```
##### To stop the containers
```
$ docker stop apache proxyserver
 ```
##### To start the containers
```
$ docker start apache proxyserver
```
##### To kill the containers
```
$ docker kill $(docker ps -a -q)
```
##### To remove the containers
```
$ docker rm apache proxyserver
$ docker rm $(docker ps -a -q)
```
##### To remove single/all docker images
```
$ docker rmi centos
$ docker rmi -f centos
$ docker rmi -f $(docker images -a -q)
```
##### To delete everything
```
$ docker system prune # Just delete the stopped containers and build cache
$ docker system prune --volumes  # Delete everything excluding images
$ docker system prune -a --volumes # Delete everything [Images, vol, network, containers]
```
##### Errors
```
certificate error message:

docker: Error response from daemon: Get "https://registry-1.docker.io/v2/": x509: certificate signed by unknown authority.

fix: update zscaler certificate through vagrant provision and restart the docker daemon
```

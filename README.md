## dockers cheet-sheet

##### Docker installation on CentOS
```
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce

* To enable and start the docker service
systemctl --now enable  docker
```
##### To display docker version and info ##### 
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
##### To execute docker image
```
$ docker run hello-world
$ docker run -it centos (or) docker run -it centos bash
```
##### To create and start images
```
$ docker create -it centos
$ docker start -ai "container id"
```
###### To pull/download the docker image and run the apache application on the container.
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

=> where the first port is container port and 2nd port is on the host machine.

=> Verify the webpage status form the web browser http://192.168.10.12/
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

=> Verify the webpage status form the web browser http://192.168.10.12:8080/

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
$ docker stats apache (or) docker stats 
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


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
$ docker pull centos # It would always pull the latest version image
```
##### To list all downloaded and local images
```
$ docker images
```
##### To pull docker image and run the container with a single command
```
$ docker run hello-world
$ docker run -it centos (or) docker run -it centos bash
```
##### To create and start container
```
$ docker create -it centos
$ docker start -ai "container id"
```
##### To run the web application
```
$ docker pull httpd:latest
$ docker run -d -p 80:80 --name web httpd
$ docker ps
$ curl localhost
```
##### List docker containers (running, all, all in quiet mode)
```
$ docker ps
$ docker ps -a
$ docker container ls
```
##### To see the running processors inside the container
```
$ docker top web
```
##### To see the container information in a json format
```
$ docker inspect web
$ docker container inspect web
```
##### To see the single/all the container resource usages
```
* To see the single container resource usage
$ docker stats web

* To see the all the containers resource usage
$ docker stats 
```
##### To run docker on-demand commands
```
$ docker exec -it web ls
```
##### To connect to the container (or) ssh to the container
```
$ docker exec -it web bash
```
##### To stop single/all the containers
```
* To stop the single container
$ docker stop web

* To stop all the containers
$ docker stop $(docker ps -aq)
```
##### To kill single/all the container
```
$ docker kill web
$ docker kill $(docker ps -aq)
```
##### To remove single/all containers
```
$ docker rm web
$ docker rm $(docker ps -aq)
```
##### To remove single/all docker images
```
$ docker rmi httpd
$ docker rmi -f httpd
$ docker rmi -f $(docker images -aq)
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

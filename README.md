# dockers
# Dockers new vision towards technology.

## Display Docker version and info
docker --version
docker version
docker info

## To search Docker Image
docker search centos

## Pull Docker Images:
docker pull centos
docker pull centos:latest

# To List all downloaded or local images
docker images
docker images -a

## Execute Docker image
docker run hello-world
docker run -it centos (or) docker run -it centos bash

## Create and Start Images
docker create -it centos
docker start -ai "container id"

## List Docker images
docker images

## List Docker containers (running, all, all in quiet mode)
docker ps
docker ps -a

# Kill Running Docker image
docker kill "container id"

# To delete all the caching and images
docker system prune

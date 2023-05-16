## To build custom image
##### dockerfile
```
FROM nginx:latest

LABEL version="1.0"
LABEL maintainer="Mahesh"

RUN apt update
RUN apt -y install cifs-utils
RUN rm -rf /var/cache/apt

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

##### To build the application
```
docker build -t maheshreddy/nginx-cifs
```
##### To start and login into container
```
docker run -it maheshreddy/nginx-cifs bash

if you use entrypoint in dockerfile specify entrypoint
docker run -it maheshreddy/nginx-cifs --entrypoint bash
```
##### To start the container with port 81 from localhost
```
docker run -itd -p 81:80 maheshreddy/nginx-cifs
```
##### Validate the nginx service
```
curl localhost:81
```
##### To push the image to the docker repository
```
docker login
docker push maheshreddy/nginx-cifs
```
##### to pull the image again
##### Before that delete the local image
```
docker rmi -f maheshreddy/nginx-cif
docker pull maheshreddy/nginx-cifs
```

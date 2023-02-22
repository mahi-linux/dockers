## docker-compose

##### To start the docker container
```
docker-compose up -d
```
##### To verify docker process
```
docker-compose ps -a (or) 
docker ps -a
```
##### To connect to the container
```
docker exec -it <container id> bash
ps -ef | grep -i httpd
```
##### To validate
```
curl -k http://localhost:8080
```



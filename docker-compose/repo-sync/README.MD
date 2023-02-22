## docker-compose

##### To start the docker container
```
docker-compose up -d
```
##### To connect to the container
```
docker exec -it <container id> bash
ps -ef | grep -i httpd
```
##### To check the logs
```
docker-compose logs -f --tail=5 rhel7
```
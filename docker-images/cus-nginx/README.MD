## Apache Dockerfile

##### Build Image
```
docker build -t nginx .
```

##### Run Container
```
* map local port 80 with app port 8080
docker run -itd -p 80:8080 --name web nginx
```

##### Validate
```
curl localhost
```

##### Stop Container
```
docker stop web
```

##### Delete Container and Image
```
* To Delete Container
docker rm web

* To Delete Image
docker rmi -f nginx
```
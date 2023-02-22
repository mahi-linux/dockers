## Apache Dockerfile

##### Build Image
```
docker build -t apache .
```

##### Run Container
```
docker run -itd -p 80:80 --name apache apache
```

##### Validate
```
curl localhost
```

##### Stop Container
```
docker stop apache
```

##### Delete Container and Image
```
* To Delete Container
docker rm apache

* To Delete Image
docker rmi -f apache
```
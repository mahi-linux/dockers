## Apache Dockerfile

##### Build Image
```
docker build -t httpd .
```

##### Run Container
```
docker run -itd -p 80:80 --name web httpd
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
docker rmi -f httpd
```
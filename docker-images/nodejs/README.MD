## Nodejs Dockerfile

##### Prerequisites
```
* Install NPM Package
```
##### Build simple Nodejs application
```
* create package, "init -y" will create package.json and "install express" will create package-lock.json files
npm init -y
npm install express
npm audit fix

* run the application locally to if it is working as expected.
node app.js
```
##### Build Image
```
docker build -t app-node .
```

##### Run Container
```
docker run -itd -p 3000:3000 --name nodejs app-node
```

##### Validate
```
curl -k http://localhost:3000
```

##### Stop Container
```
docker stop nodejs
```

##### Delete Container and Image
```
* To Delete Container
docker rm nodejs

* To Delete Image
docker rmi -f app-node
```

## Random volumes

##### Create a directory and mount as a volume
```
mkdir /mahesh
docker run --user root -it -v /mahesh:/test eeb6ee3f44bd bash

[root@sal-webp01 ~]# docker run -it --name centos8 -v /data01 centos df -h /data01
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        40G  3.8G   37G  10% /data01

[root@sal-webp01 ~]# docker volume ls
DRIVER    VOLUME NAME
local     a002ac46da8fce7e90647e58bda0cfb49c3427665da5205cd0c299b7f26388ae
```
##### Named volumes
```
* Create a volume and attach to the container:

[root@sal-webp01 ~]# docker volume create myvol
myvol

[root@sal-webp01 ~]# docker run -it --name myapp -v myvol:/myvol centos df -h /myvol
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        40G  3.8G   37G  10% /myvol
```
```
* Attach a volume while creating container:

[root@sal-webp01 ~]# docker run -it --name webapp -v webapp:/webapp centos df -h /webapp
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        40G  3.8G   37G  10% /webapp

[root@sal-webp01 ~]# docker volume ls
DRIVER    VOLUME NAME
local     webapp

[root@sal-webp01 ~]# docker volume inspect webapp
[
    {
        "CreatedAt": "2021-04-29T23:42:19Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/webapp/_data",
        "Name": "webapp",
        "Options": null,
        "Scope": "local"
    }
]
```
##### Host Volumes:
```
* Mount shared directory and it will not create any volume

[root@sal-webp01 ~]# docker run -it --name centos8 -v /nfsclient:/nfsclient centos df -h /nfsclient
Filesystem               Size  Used Avail Use% Mounted on
192.168.10.13:/nfsshare   18G  1.6G   16G  10% /nfsclient
```
##### Hosts volume with mount option
```
docker run -it --name centos8 --mount source=testdir,target=/data01 centos. # with mount option will not work for volumes created under "/"
```
##### Create CIFS/Samba volumes
```
* Create a Volume:

docker volume create \
	--driver local \
	--opt type=cifs \
	--opt device=//pswus2prodrepo01stor.file.core.windows.net/centos7 \
	--opt o=username=uxxxxxxx,password=*****,file_mode=0777,dir_mode=0777 \
	--name cif-volume

* Attach the volume to the container:

docker run -it --name centos79 -v cif-volume:/repocent7 centos:7 df -h /repocent7
Filesystem                                            Size  Used Avail Use% Mounted on
//pswus2prodrepo01stor.file.core.windows.net/centos7  200G  896K  200G   1% /repocent7

docker volume inspect cif-volume
```
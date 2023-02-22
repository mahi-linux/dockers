#!/bin/bash
# This script creates sequence values till 7th

# verify the FS
if [ ! -d /rhel8 ] ; then
echo error: Repo sync file system not found.
exit
fi

# get the serial key
serial=`(ls -tld -- /rhel8/$(date +"%Y%m%d")* | head -1 | awk '{print $NF}' | tail -c 3)` >/dev/null 2>&1

i=$serial

let i=$serial+1

if [ $i -eq 8 ]; then
echo error: the sequence value is 08.
exit
fi

subscription-manager register --org=<org-id> --activationkey=docker-keys --force
yum clean all
getdir=$(date +"%Y%m%d0$i")
yum -y install yum-utils
reposync -p /rhel8/test/$getdir --repoid=rhel-8-for-x86_64-appstream-rpms --download-metadata
reposync -p /rhel8/test/$getdir --repoid=rhel-8-for-x86_64-baseos-rpms --download-metadata

#!/bin/bash
# This script creates sequence values till 7th

# verify the FS
if [ ! -d /rhel7 ] ; then
echo error: Repo sync file system not found.
exit
fi

# get the serial key
serial=`(ls -tld -- /rhel7/$(date +"%Y%m%d")* | head -1 | awk '{print $NF}' | tail -c 3)` >/dev/null 2>&1

i=$serial

let i=$serial+1

if [ $i -eq 8 ]; then
echo error: the sequence value is 08.
exit
fi

subscription-manager register --org=<org-id> --activationkey=docker-keys --force
rm -rf /var/cache/yum
yum -y install createrepo
getdir=$(date +"%Y%m%d0$i")
reposync --gpgcheck -r rhel-7-server-rpms -p /rhel7/test/$getdir --downloadcomps --download-metadata -l
createrepo -v /rhel7/test/$getdir/rhel-7-server-rpms

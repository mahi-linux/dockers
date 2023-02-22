#!/bin/bash
# This script creates sequence values till 7th

# verify the FS
if [ ! -d /centos7 ] ; then
echo error: Repo sync file system not found.
exit
fi

# get the serial key
serial=`(ls -tld -- /centos7/$(date +"%Y%m%d")* | head -1 | awk '{print $NF}' | tail -c 3)` >/dev/null 2>&1

i=$serial

let i=$serial+1

if [ $i -eq 8 ]; then
echo error: the sequence value is 08.
exit
fi

rm -rf /var/cache/yum
yum -y install createrepo
rpm --import https://repo.saltproject.io/py3/redhat/7/x86_64/latest/SALTSTACK-GPG-KEY.pub
curl -fsSL https://repo.saltproject.io/py3/redhat/7/x86_64/latest.repo | tee /etc/yum.repos.d/salt.repo

reposync -g -l -d -m --repoid=base --newest-only --download-metadata --download_path=/centos7/test/$(date +"%Y%m%d0$i")
reposync -g -l -d -m --repoid=updates --newest-only --download-metadata --download_path=/centos7/test/$(date +"%Y%m%d0$i")
reposync -g -l -d -m --repoid=salt-latest-repo --newest-only --download-metadata --download_path=/centos7/test/$(date +"%Y%m%d0$i")

createrepo -g comps.xml /centos7/test/$(date +"%Y%m%d0$i")/base
createrepo -v /centos7/test/$(date +"%Y%m%d0$i")/updates
createrepo -v /centos7/test/$(date +"%Y%m%d0$i")/salt-latest-repo

#!/bin/bash


if [ ! -d /tmp/golang ];then
   mkdir /tmp/golang
fi

cd /tmp/golang
if [ ! -f go1.7.linux-amd64.tar.gz ];then  
   curl -LO https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
fi

#Check authenticity
shasum -a 256 go1.7*.tar.gz

tar -C /usr/local -xvzf go1.7.linux-amd64.tar.gz

if [ ! -f /etc/profile.d/golang.sh ];then

   touch /etc/profile.d/golang.sh
   echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile.d/golang.sh
fi

mkdir -p ~/projects/{bin,pkg,src}
echo "export GOROOT=/usr/local/go" >> ~/.bash_profile

#export PATH=$PATH:/usr/local/go/bin

echo "export GOBIN=${HOME}/projects/bin" >> ~/.bash_profile
echo "export GOPATH=${HOME}/projects/src" >> ~/.bash_profile

source /etc/profile && source ~/.bash_profile



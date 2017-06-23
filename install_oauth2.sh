#!/bin/bash
source ~/.bash_profile
source /etc/profile

if [ ! -d /tmp/oauth ];then
 mkdir /tmp/oauth
fi

cd /tmp/oauth

if [ ! -f oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz ];then

  wget https://github.com/bitly/oauth2_proxy/releases/download/v2.2/oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz 
  tar -xvzf oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz
  cp oauth2_proxy-2.2.0.linux-amd64.go1.8.1/oauth2_proxy /usr/local/go/bin

fi

source /etc/profile

oauth2_proxy -client-id="aa4227354123159f6546" -client-secret="877254cf43ef0d9c7a5eadcdb81ed0fd227cf895" -provider="github" -cookie-secret="kushal@##$%-" -email-domain="*" -upstream http://172.17.0.2 -redirect-url=http://127.0.0.1:4180/oauth2/callback -cookie-secure=false -http-address=0.0.0.0:4180

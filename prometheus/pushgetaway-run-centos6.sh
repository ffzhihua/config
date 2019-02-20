#!/bin/bash

cd /opt

wget https://github.com/prometheus/pushgateway/releases/download/v0.4.0/pushgateway-0.4.0.linux-amd64.tar.gz

tar zxvf pushgateway-0.4.0.linux-amd64.tar.gz

mv pushgateway-0.4.0.linux-amd64 pushgateway

nohup /opt/pushgateway/pushgateway & 

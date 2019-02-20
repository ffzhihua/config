#!/bin/bash

cd /opt

if [ ! -f "/opt/pushgateway-0.4.0.linux-amd64.tar.gz" ];then

wget wget https://github.com/prometheus/pushgateway/releases/download/v0.4.0/pushgateway-0.4.0.linux-amd64.tar.gz

fi 

tar zxvf pushgateway-0.4.0.linux-amd64.tar.gz

mv pushgateway-0.4.0.linux-amd64 pushgateway


echo "[Unit]
Description=auto run prometheus pushgateway
[Service]
Type=simple
ExecStart=/opt/pushgateway/pushgateway
Restart=always 
KillMode=process 
RestartSec=1
[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/pushgateway.service

systemctl enable pushgateway

systemctl start pushgateway 

systemctl status pushgateway 

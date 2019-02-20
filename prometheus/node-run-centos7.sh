#!/bin/bash

cd /opt

wget https://github.com/prometheus/node_exporter/releases/download/v0.17.0/node_exporter-0.17.0.linux-amd64.tar.gz

tar zxvf node_exporter-0.17.0.linux-amd64.tar.gz

mv node_exporter-0.17.0.linux-amd64 node_exporter

echo "[Unit]
Description=auto run prometheus node_exporter
[Service]
Type=simple
ExecStart=/opt/node_exporter/node_exporter
Restart=always 
KillMode=process 
RestartSec=1
[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/node_exporter.service

systemctl enable node_exporter

systemctl start node_exporter 

systemctl status node_exporter 

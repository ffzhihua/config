#!/bin/bash

cd /opt

wget https://github.com/prometheus/mysqld_exporter/releases/download/v0.11.0/mysqld_exporter-0.11.0.linux-amd64.tar.gz

tar zxvf mysqld_exporter-0.11.0.linux-amd64.tar.gz

mv mysqld_exporter-0.11.0.linux-amd64 mysqld_exporter

echo "[client]
user=root
password=123456
" > /opt/mysqld_exporter/.my.cnf

echo "[Unit]
Description=auto run prometheus mysqld_exporter
[Service]
Type=simple
ExecStart=/opt/mysqld_exporter/mysqld_exporter --config.my-cnf=/opt/mysqld_exporter/.my.cnf
Restart=always 
KillMode=process 
RestartSec=1
[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/mysqld_exporter.service

systemctl start mysqld_exporter 

systemctl status mysqld_exporter 

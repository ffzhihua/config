#!/bin/bash

cd /data

wget https://github.com/prometheus/node_exporter/releases/download/v0.17.0/node_exporter-0.17.0.linux-amd64.tar.gz

tar zxvf node_exporter-0.17.0.linux-amd64.tar.gz

mv node_exporter-0.17.0.linux-amd64 node_exporter

nohup /opt/node_exporter/node_exporter & 

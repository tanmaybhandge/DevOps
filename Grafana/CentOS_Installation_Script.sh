#!/bin/bash

# You can perform the sudo yum update -y

# Install required dependencies
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y initscripts fontconfig

# Add Grafana repository and install Grafana
sudo tee /etc/yum.repos.d/grafana.repo <<EOF
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF

# Install Grafana
sudo yum install -y grafana

# Start Grafana service and enable it to start on boot
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

# Disable Firewall configuration
sudo systemctl stop firewalld
sudo systemctl disable firewalld

echo "Grafana installation and configuration completed."

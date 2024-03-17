#!/bin/bash

API_PORT=${api_port}
KEYS_PORT=${keys_port}


# Install dependencies
sudo yum update && sudo yum install docker -y
sudo systemctl start docker

# Download Jigsaw's install_server.sh
sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh) --api-port=$API_PORT --keys-port=$KEYS_PORT" > /var/log/outline-install.log

# Allow external access to API
echo "Opening ports $API_PORT and $KEYS_PORT"
sudo iptables -A INPUT -p tcp --dport $API_PORT -j ACCEPT
sudo iptables -A INPUT -p tcp --dport $KEYS_PORT -j ACCEPT

# Print the API url
API_URL = $(grep "apiUrl" /var/log/outline-install.log >> /tmp/outline-install-details.txt)
echo "Copy this url to create a customer outline server in your Outline manager:"
echo $API_URL
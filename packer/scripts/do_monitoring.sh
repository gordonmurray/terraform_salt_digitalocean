#!/usr/bin/env bash

set -xe

# install the Digital Ocean monitoring script
curl -sSL https://agent.digitalocean.com/install.sh | sh

# confirm its running
sudo service do-agent status
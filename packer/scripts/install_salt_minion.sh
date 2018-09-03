#!/usr/bin/env bash

set -xe

sudo apt-get update

sudo apt-get upgrade -y

sudo apt-get install salt-minion -y

sudo service salt-minion status
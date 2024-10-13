#!/bin/sh

apt update
apt install curl -y

curl -sSL https://get.docker.com/ | CHANNEL=stable sh
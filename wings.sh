#!/bin/sh

apt update
apt install curl -y

curl -sSL https://get.docker.com/ | CHANNEL=stable sh

systemctl enable --now docker

mkdir -p /etc/pelican /var/run/wings
curl -L -o /usr/local/bin/wings "https://github.com/pelican-dev/wings/releases/latest/download/wings_linux_$([[ "$(uname -m)" == "x86_64" ]] && echo "amd64" || echo "arm64")"
chmod u+x /usr/local/bin/wings

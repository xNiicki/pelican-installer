#!/bin/sh

apt update
apt install curl -y

curl -sSL https://get.docker.com/ | CHANNEL=stable sh

systemctl enable --now docker

mkdir -p /etc/pelican /var/run/wings
curl -L -o /usr/local/bin/wings "https://github.com/pelican-dev/wings/releases/latest/download/wings_linux_$([[ "$(uname -m)" == "x86_64" ]] && echo "amd64" || echo "arm64")"
chmod u+x /usr/local/bin/wings

echo "Create your config.yml here is the documentation: https://pelican.dev/docs/wings/install#configure"
echo "Paste your entire configuration below. Press Ctrl+D when finished:"
cat > /etc/pelican/config.yml

echo "Configuration has been written to /etc/pelican/config.yml"


echo "
[Unit]
Description=Wings Daemon
After=docker.service
Requires=docker.service
PartOf=docker.service

[Service]
User=root
WorkingDirectory=/etc/pelican
LimitNOFILE=4096
PIDFile=/var/run/wings/daemon.pid
ExecStart=/usr/local/bin/wings
Restart=on-failure
StartLimitInterval=180
StartLimitBurst=30
RestartSec=5s

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/wings.service

systemctl enable --now wings
systemctl start wings
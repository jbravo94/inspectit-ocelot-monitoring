#!/bin/bash

# Fix for vagrant scp
chmod 777 /tmp

# Docker Installation
sysctl -w vm.max_map_count=262144

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Docker Compose Autostart
cat <<EOF >/etc/systemd/system/docker-compose@.service
[Unit]
Description=%i service with docker compose
Requires=docker.service
After=docker.service

[Service]
Type=oneshot
RemainAfterExit=true
WorkingDirectory=/etc/docker/compose/%i
ExecStart=/usr/local/bin/docker compose up -d --remove-orphans
ExecStop=/usr/local/bin/docker compose down

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload

mkdir -p /etc/docker/compose

# Enable inspectit-ocelot
ln -s /opt/inspectit-ocelot /etc/docker/compose/inspectit-ocelot
systemctl enable docker-compose@inspectit-ocelot.service

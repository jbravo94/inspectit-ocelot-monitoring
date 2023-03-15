#!/bin/bash

# Install Packages
apt update
apt install -y virtualbox-guest-utils virtualbox-guest-dkms

# Install Guest Additions
wget http://download.virtualbox.org/virtualbox/6.1.38/VBoxGuestAdditions_6.1.38.iso
mkdir /media/VBoxGuestAdditions
mount -o loop,ro VBoxGuestAdditions_6.1.38.iso /media/VBoxGuestAdditions
echo "yes" | sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm VBoxGuestAdditions_6.1.38.iso
umount /media/VBoxGuestAdditions
rmdir /media/VBoxGuestAdditions

# Docker Installation
sysctl -w vm.max_map_count=262144
echo "vm.max_map_count=262144" >> /etc/sysctl.conf

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
ExecStart=/usr/bin/docker compose up -d --remove-orphans
ExecStop=/usr/bin/docker compose down

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload

mkdir -p /etc/docker/compose

# Enable inspectit-ocelot
ln -s /opt/inspectit-ocelot /etc/docker/compose/inspectit-ocelot
systemctl enable docker-compose@inspectit-ocelot.service

# Prefetch docker images
(cd /opt/inspectit-ocelot && docker compose pull)

# Bootstrap
(cd /opt/inspectit-ocelot && docker compose up -d --wait)
sleep 5000
(cd /opt/inspectit-ocelot && docker compose down)

poweroff

#!/bin/sh

apt -y update
apt -y upgrade

apt -y install autossh

cat > /etc/default/autossh <<EOF
AUTOSSH_GATETIME=0
AUTOSSH_PORT=222
SSH_OPTIONS="-N -o 'ServerAliveInterval 60' -o 'ServerAliveCountMax 3' -R $PORT:127.0.0.1:22 ton@remote.sookyenfarm.com"
EOF

cat > /lib/systemd/system/autossh.service <<EOF
[Unit]
Description=autossh
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=root
EnvironmentFile=/etc/default/autossh
ExecStart=
ExecStart=/usr/bin/autossh \$SSH_OPTIONS
Restart=always
RestartSec=60

[Install]
WantedBy=multi-user.target
EOF

ln -s /lib/systemd/system/autossh.service /etc/systemd/system/autossh.service

systemctl daemon-reload
systemctl enable autossh
systemctl start autossh

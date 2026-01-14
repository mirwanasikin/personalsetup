#!/bin/bash
set -euo pipefail

# Cek sudo
if [[ "$EUID" != 0 ]]; then
  echo "Jalankan script ini pakai sudo" >&2
  exit 1
fi

echo "Mulai konfigurasi DNS: $(date '+%Y-%m-%d %H:%M:%S')"

# Backup dulu resolved.conf lama
if [ -f /etc/systemd/resolved.conf ]; then
    cp /etc/systemd/resolved.conf /etc/systemd/resolved.conf.bak_$(date '+%Y%m%d%H%M%S')
    echo "Backup resolved.conf dibuat"
fi

# Tulis konfigurasi baru
cat <<EOF >/etc/systemd/resolved.conf
[Resolve]
DNS=1.1.1.1 9.9.9.9
DNSOverTLS=yes
DNSSEC=no
EOF

# Enable & restart systemd-resolved
systemctl enable --now systemd-resolved

# Cek Resolved
resolvectl status

echo "DNS berhasil dikonfigurasi dan service systemd-resolved diaktifkan"

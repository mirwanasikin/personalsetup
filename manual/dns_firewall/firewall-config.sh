#!/bin/bash
set -euo pipefail

# Cek sudo
if [[ "$EUID" != 0 ]]; then
  echo "Jalankan script ini pakai sudo" >&2
  exit 1
fi

echo "Mulai konfigurasi firewall: $(date '+%Y-%m-%d %H:%M:%S')"

# Simpan runtime rules jadi permanent
firewall-cmd --runtime-to-permanent

# Hapus port random / tidak perlu
ports_to_remove_tcp=(8080 8081-65535 1025-8079)
ports_to_remove_udp=(1025-65535)

for p in "${ports_to_remove_tcp[@]}"; do
  firewall-cmd --remove-port="$p"/tcp --permanent || true
done

for p in "${ports_to_remove_udp[@]}"; do
  firewall-cmd --remove-port="$p"/udp --permanent || true
done

# Buka port penting 1714-1764
firewall-cmd --add-port=1714-1764/tcp --permanent
firewall-cmd --add-port=1714-1764/udp --permanent

# Reload firewall
firewall-cmd --reload

echo "Konfigurasi firewall selesai: $(date '+%Y-%m-%d %H:%M:%S')"

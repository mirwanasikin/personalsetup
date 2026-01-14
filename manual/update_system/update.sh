#!/usr/bin/env bash
### This is script update for Fedora System

set -Eeuo pipefail
DATE=$(date '+%Y-%m-%d')
# Verify user
if [[ "$EUID" -ne 0 ]]; then
  echo "Please use sudo to use this script"
  echo "sudo $0"
  exit 1
fi

# Update the system

echo "Upgrade the system $DATE"

dnf upgrade -y --refresh

# Add rpmfusion

echo "Add rpmfusion"
# Free
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# Nonfree
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Done"

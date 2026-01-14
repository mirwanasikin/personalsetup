#!/usr/bin/env bash
### Vanilla kernel for Fedora
### Warning this will be using Fedora Vanilla kernel so please aware this is without Fedora team checkup

# Verify
if [[ "$EUID" -ne 0 ]]; then
  echo "Please use Sudo"
  exit 1
fi

# Download the COPR repository
echo "Download and Place the Repository"
curl -o /etc/yum.repos.d/kernel-vanilla-stable.repo \
  https://copr.fedorainfracloud.org/coprs/g/kernel-vanilla/stable/repo/fedora-$(rpm -E %fedora)/kernel-vanilla-stable.repo

# Refresh Repo
echo "Refreshing the repository"
dnf clean all
dnf makecache

# Install the vanilla kernel
echo "Installing the kernel at $(date '+%Y-%m-%d')"
dnf install kernel \
  --enablerepo=copr:copr.fedorainfracloud.org:group_kernel-vanilla:stable \
  --best

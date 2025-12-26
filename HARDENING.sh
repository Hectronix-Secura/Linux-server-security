#!/bin/bash

# =========================================
# Linux Server Basic Hardening Script
# Author: Linux & Cybersecurity Freelancer, ZHM
# =========================================

echo "Starting Linux server hardening..."

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# 1. System update
echo "[1/6] Updating system packages..."
apt update && apt upgrade -y

# 2. Install basic security tools
echo "[2/6] Installing security packages..."
apt install -y ufw fail2ban unattended-upgrades

# 3. Firewall configuration
echo "[3/6] Configuring firewall..."
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw --force enable

# 4. Disable root SSH login
echo "[4/6] Hardening SSH configuration..."
SSH_CONFIG="/etc/ssh/sshd_config"

if grep -q "^PermitRootLogin" $SSH_CONFIG; then
  sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' $SSH_CONFIG
else
  echo "PermitRootLogin no" >> $SSH_CONFIG
fi

# Restart SSH service
systemctl restart ssh

# 5. Enable Fail2Ban
echo "[5/6] Enabling Fail2Ban..."
systemctl enable fail2ban
systemctl start fail2ban

# 6. Enable automatic security updates
echo "[6/6] Enabling automatic security updates..."
dpkg-reconfigure -f noninteractive unattended-upgrades

echo "Hardening completed successfully."
echo "Please review SSH access before closing your session."

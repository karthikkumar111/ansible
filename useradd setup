#!/bin/bash
# ===============================
# Simple Ansible Setup Script
# ===============================

# Update system
sudo dnf update -y

# Create ansible user and set password = 12345
sudo useradd ansible
echo "ansible:12345" | sudo chpasswd

# Allow passwordless sudo for ansible
echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# Enable password authentication in SSH
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Restart SSH service
sudo systemctl restart sshd

echo "✅ Ansible setup completed!"

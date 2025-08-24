#!/bin/bash

# Update system
sudo dnf update -y

# Create ansible user
sudo useradd ansible
echo "ansible:ansible" | sudo chpasswd   # password = ansible

# Allow passwordless sudo for ansible
echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# Enable password authentication in sshd_config
sudo sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Restart sshd
sudo systemctl restart sshd

# Install Ansible
sudo dnf install ansible-core -y

# Verify installation
ansible --version

# Create Ansible config directory and files
sudo mkdir -p /etc/ansible
sudo touch /etc/ansible/hosts

# Configure ansible.cfg
sudo tee /etc/ansible/ansible.cfg > /dev/null <<EOL
[defaults]
inventory = /etc/ansible/hosts
remote_user = ansible
host_key_checking = False
retry_files_enabled = False
EOL

echo "✅ Setup complete!"

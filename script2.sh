#! /bin/bash
sudo -- sh -c "echo 192.168.100.11 soufe1 >> /etc/hosts"
sudo setenforce 0
sudo systemctl enable chronyd
sudo systemctl start chronyd 
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

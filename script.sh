#! /bin/bash
sudo yum install epel-release -y
sudo yum install ansible -y
sudo setenforce 0
sudo -- sh -c "echo 192.168.100.12 soube2 >> /etc/hosts"
sudo systemctl enable chronyd
sudo systemctl start chronyd 
sudo systemctl start firewalld
sudo systemctl enable firewalld 
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd
mkdir -p /home/vagrant/.ssh
ssh-keyscan soube2 >> /home/vagrant/.ssh/known_hosts
ssh-keyscan soufe1 >> /home/vagrant/.ssh/known_hosts
ssh-keygen -f /home/vagrant/.ssh/id_rsa -N '' <<< y
sshpass -p 'vagrant' ssh-copy-id soube2 
sshpass -p 'vagrant' ssh-copy-id soufe1
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.crypto
ansible-galaxy collection install community.general
#ansible-galaxy role init sou_podman
ansible-galaxy collection install containers.podman
cd /vagrant
ansible-playbook /vagrant/deploy.yml
rm -rf /vagrant/script.sh
rm -rf /vagrant/script2.sh

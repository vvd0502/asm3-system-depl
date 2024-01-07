useradd ansibleadmin
#set password for ansibleadmin as 123
echo "123" | passwd --stdin ansibleadmin

#in /etc/sudoers, add "ansibleadmin ALL=(ALL) NOPASSWD: ALL" so that ansibleadmin can run sudo command without password
echo "ansibleadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#in /etc/ssh/sshd_config, change "PasswordAuthentication no" to "PasswordAuthentication yes" to turn on password authentication in ssh
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

#restart sshd
service sshd reload

#install ansible
amazon-linux-extras install ansible2 -y
#install docker
sudo yum install docker -y
#add ansibleadmin to docker group
sudo usermod -aG docker ansibleadmin

# #change hostname to ansible-server in /etc/hostname
# echo "ansible-server" > /etc/hostname

# #reboot
# reboot
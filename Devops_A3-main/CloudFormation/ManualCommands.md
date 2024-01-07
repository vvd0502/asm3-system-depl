nano /var/log/cloud-init-output.log for debugging..

# START JENKINS, AND ALSO DOCKER IN BOTH DOCKER AND ANSIBLE SERVER
# LOGIN TO DOCKER ON ANSIBLE AS ANSIBLE ADMIN
# Ansible server ansibleadmin
run ssh-keygen with default options

# On Docker server
Run if config to get ip

# On ansible server as root
Add docker and ansible IP in infconfigto /etc/ansible/hosts
format:
[dockerserver]
ip
[ansibleserver]
ip

# Ansible server ansible admin      
ssh-copy-id dockerIP
ssh-copy-id ansibleIP

# Ansible ansible admin
ansible all -a uptime

# Jenkin GUI
Get password at /var/lib/jenkins/secrets/initialAdminPassword
add ssh server
add pipeline from github SCM
add website project for scm
Select poll SCM and poll at * * * * * (every minute)
Set jenkinsfile path to Scripts/AdvancedRequirement/Jenkins/Jenkinsfile
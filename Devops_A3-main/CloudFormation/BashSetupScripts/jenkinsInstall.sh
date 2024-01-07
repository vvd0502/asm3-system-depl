wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
amazon-linux-extras install java-openjdk11 -y
yum install jenkins -y
yum install git -y

#start jenkins
service jenkins start
#wait for jenkins to start

MAVEN=https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
MAVENZIP=apache-maven-3.9.6-bin.tar.gz
MAVENFOLDER=apache-maven-3.9.6
# Setup maven
cd /opt
wget $MAVEN
tar -xvzf $MAVENZIP
mv $MAVENFOLDER maven
cd ~

#wait for jenkins to start
sleep 30

JENKINS_ADDRESS=http://localhost:8080
#install jenkins cli
wget $JENKINS_ADDRESS/jnlpJars/jenkins-cli.jar

#get generated password
PASSWORD=$(cat /var/lib/jenkins/secrets/initialAdminPassword)
#login jenkins 
java -jar jenkins-cli.jar -s $JENKINS_ADDRESS -auth admin:$PASSWORD install-plugin publish-over-ssh github workflow-aggregator 

service jenkins restart

# #change hostname to jenkins-server in /etc/hostname
# echo "jenkins-server" > /etc/hostname

# #reboot
# reboot

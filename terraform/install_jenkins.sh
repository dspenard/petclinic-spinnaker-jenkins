

#!/bin/bash
sudo yum -y update

echo "Install Java JDK 8"
yum remove -y java
yum install -y java-1.8.0-openjdk

echo "Install Maven"
yum install -y maven 

echo "Install git"
yum install -y git

echo "Install Docker engine"
yum update -y
yum install docker -y
#sudo usermod -a -G docker jenkins
#sudo service docker start
sudo chkconfig docker on

echo "Install Jenkins"

#if wget fails, check permission: e.g. sudo chmod 777 /etc/yum.repos.d
#also might need double-quotes around URL
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo

#if issues with key then do: yum install -y jenkins --nogpgcheck
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install -y jenkins

sudo usermod -a -G docker jenkins
sudo chkconfig jenkins on
sudo service docker start
sudo service jenkins start


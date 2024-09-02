# Run this command after connecting to the ec2 to run the jenkins container

docker run -d -p 8080:8080 -v /home/ubuntu/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --restart=always --name jenkins_master anas1243/jenkins-with-docker
pipeline {

    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-cred')
    }

    stages {
        stage('Build the image') {
            steps {
                // build the image
                sh "docker build . -t anas1243/devops-challenge"     
            }
        }
        stage('Create and push the new Artifact') {
            steps {
                // dockerhub login
                sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
                // push the artifact to dockerhub
                sh "docker push anas1243/devops-challenge"
            }
        }
        stage('Deploy the App') {
            steps {
                // stop and remove the old version (as we're testing it's fine to have a downtime here)
                sh "docker stop devops && docker rm devops"
                // run the container on the host
                sh "docker run -d --restart=always --name devops -p 8888:8888 anas1243/devops-challenge:latest"
            }
        }
    }
}

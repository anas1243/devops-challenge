# Aim

This project is a hands-on lab to automate the deployment of a python webapp using AWS, Docker, Terraform, and Jenkins

## Local Deployment

1- Build the docker image

``` docker build . -t anas1243/devops-challenge ```

![Build Docker](images/build-docker.png)

2- Run a Docker container from this image

``` docker run -d --name devops -p 8888:8888 anas1243/devops-challenge:latest ```


![Build Run](images/run-docker.png)

3- Test the deployment using Curl utility

``` curl http://localhost:8888/ ```

``` curl http://localhost:8888/healthcheck ```

![Test the APP](images/curl-commands.png)


## AWS Deployment

1- run Terraform to provision the infra

``` terraform init ```
``` terraform apply ```

![Initializing Terraform](images/terraform-init.png)
![Initializing Terraform](images/terraform-apply.png)

2- see the infra in AWS

![AWS infra](images/aws-console.png)

3- SSH to the Jenkins instance and run Jenkins

``` docker run -d -p 8080:8080 -v /home/ubuntu/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --restart=always --name jenkins_master anas1243/jenkins-with-docker ```

![Run Jenkins](images/run-jenkins.png)

![Jenkins Dashboard](images/jenkins-dashboard.png)

![Jenkins Dashboard](images/jenkins-home.png)

4- Add dockerhub credentials

![Jenkins Dashboard](images/dockerhub-cred.png)

5- Create, configure, and run the pipeline

I created a multi-branch pipeline in order to automate all env in the company. I created for now a jenkins file in the main branch that build, push, and deploy and code on the same instance

![Jenkins Dashboard](images/pipeline-test.png)

6- configure webhook to auto deploy the app

in the github repo we need to enable the webhook feature to push the new code version to the servers directly

![Jenkins Dashboard](images/github-webhook.png)


7- make a change in the application to detect the triggering of the pipeline

![Jenkins Dashboard](images/new-release.png)

** very important note **
can you see the commit hash is the same in my vscode and in jenkins. So it detected the correct push :wink:

after changing in the code and push these changes to github, jenkins should get an API call and the pipeline should be trigger  as shown below. 

![Jenkins Dashboard](images/trigger-jenkins.png)


after waiting the pipeline to finish it's work successfully, we need to test the three endpoint
A- /
B- /healthcheck
c- /test-automation

![Jenkins Dashboard](images/success-pipeline.png)

8- Test the webapp

now lets curl our APIs or simply use the browser

![Jenkins Dashboard](images/root-test.png)

![Jenkins Dashboard](images/healthcheck-test.png)

![Jenkins Dashboard](images/new-release-test.png)

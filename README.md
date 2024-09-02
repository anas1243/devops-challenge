# Aim

This project is a hands-on lab to automate the deployment of a python webapp using AWS, Docker, Terraform, and Jenkins

## Local Test

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
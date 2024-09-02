output "jenkins_ip" {
  value = format("%s%s", aws_instance.jenkins_master.public_ip, "")
}
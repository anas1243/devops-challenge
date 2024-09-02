resource "aws_instance" "jenkins_master" {
  ami                    = "ami-04e601abe3e1a910f"
  instance_type          = "t2.medium"
  subnet_id              = module.network.public_subnet1_id
  key_name               = "gp_katoot"
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  user_data              = file("./userdata.sh")
  iam_instance_profile = aws_iam_instance_profile.jenkins_instance_profile.name
  tags = {
    Name = "${var.use_case}_master"
  }
}

resource "aws_instance" "flask_webapp" {
  ami                    = "ami-04e601abe3e1a910f"
  instance_type          = "t2.medium"
  subnet_id              = module.network.public_subnet2_id
  key_name               = "gp_katoot"
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  user_data              = file("./userdata.sh")
  # iam_instance_profile = aws_iam_instance_profile.jenkins_instance_profile.name
  tags = {
    Name = "${var.use_case}_flask_webapp"
  }
}
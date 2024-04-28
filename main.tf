provider "aws" {
  region = "us-west-1"
}
resource "aws_instance" "Redhat_Server" {
 ami = "ami-014b33341e3a1178e"
 key_name = "Jenkins"
 availability_zone = "us-west-1c"
 instance_type = "t2.micro"
 tags = {
    Name = "Redhat_Server"
  }
}
resource "aws_ami_from_instance" "ami_name" {
  name                = "test-ami-1650"
  source_instance_id  = aws_instance.Redhat_Server.id
}
output "instance_id" {
  value = aws_instance.Redhat_Server.id
}
output "AMI_id" {
  value=aws_ami_from_instance.ami_name.id
}
resource "aws_instance" "Clone_instance" {
 availability_zone = "us-west-1b"
 ami = aws_ami_from_instance.ami_name.id
 key_name = "Jenkins"
 instance_type = "t2.micro"

 tags = {
    Name = "Redhat_Server"
  }
}


/*
resource "aws_instance" "Amazon_linux_2" {
 ami = "ami-0b1eeafca2033f846"
 key_name = "Jenkins"
 instance_type = "t2.micro"

 tags = {
    Name = "Amazon_linux_2_Server"
  }
}
resource "aws_instance" "Ubuntu_Server" {
 ami = "ami-05c969369880fa2c2"
 key_name = "Jenkins"
 instance_type = "t2.micro"

 tags = {
    Name = "Ubuntu_Server"
  }
}
*/
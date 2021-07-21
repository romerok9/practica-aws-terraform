provider "aws" {
  version = "~> 2.7"
  region  = "us-east-1"
}

resource "aws_instance" "web" {
  count = 2
  ami = "ami-0dc2d3e4c0f9ebd18"
  instance_type = "t2.micro"
  key_name = "practica"
  tags = {
    Name = "devops-${count.index}"
  }
}

output "public_ip" {
  value = "${aws_instance.web.*.public_ip}"
}

output "private_ip" {
  value = "${aws_instance.web.*.private_ip}"
}


provider "aws" {
  region = var.region
}

variable "region" {
  default = "ap-south-1"
}

data "aws_ami" "ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
}

output "web_ip" {
  value = aws_instance.web.public_ip
}


# no version
# hardcoded values
# forgetting sensitive= true for outputs which holds secrets
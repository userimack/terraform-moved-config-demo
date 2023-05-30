provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Name = "Demo"
    }
  }
}

resource "aws_vpc" "example" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "demo-vpc"
  }
}

resource "aws_subnet" "example" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "demo-subnet"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example.id

  tags = {
    Name = "demo-ec2"
  }
}




# # # Demo 2
#
# module "ec2_instance" {
#   source = "./modules/compute"
#
#   subnet_id = aws_subnet.example.id
#
#   tags = {
#     Name = "demo-ec2"
#   }
# }
#
# moved {
#   from = aws_instance.example
#   to   = module.ec2_instance.aws_instance.example
# }

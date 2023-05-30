data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id

  tags = var.tags
}


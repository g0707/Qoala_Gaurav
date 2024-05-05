resource "aws_instance" "private_instance" {
  ami           = "ami-07caf09b362be10b8"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnets.id

  tags = {
    Name = "Private Subnet Instance"
  }
}
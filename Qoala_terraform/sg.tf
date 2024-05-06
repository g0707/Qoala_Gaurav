// Security Group Creation for Private Subnet with port 22,80 open

resource "aws_security_group" "private_instance_sg" {
 name = "private_instance_sg"
 description = "This firewall allows SSH, HTTP"
 vpc_id = aws_vpc.main.id
 
 ingress {
  description = "SSH"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
 }
 
 ingress { 
  description = "HTTP"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 }
 
 tags = {
  Name = "private_instance_sg"
 }
}
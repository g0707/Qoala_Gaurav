resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 
 tags = {
   Name = "Project VPC"
 }
}

resource "aws_subnet" "public_subnets" {
 vpc_id     = aws_vpc.main.id
 cidr_block = var.public_subnet_cidr
 availability_zone = "us-east-1a"
 tags = {
   Name = "Public Subnet-1"
 }
}


resource "aws_subnet" "public_subnets_2" {
 vpc_id     = aws_vpc.main.id
 cidr_block = "10.0.2.0/24"
 availability_zone = "us-east-1b"
 tags = {
   Name = "Public Subnet-2"
 }
}


resource "aws_subnet" "private_subnets" {
 vpc_id     = aws_vpc.main.id
 cidr_block = var.private_subnet_cidr
 
 tags = {
   Name = "Private Subnet"
 }
}
// region variable
variable "region" {
  description = "AWS Deployment region"
  default = "us-east-1"
}

// public subnet variable
variable "public_subnet_cidr" {
 description = "Public Subnet CIDR values"
 default     = "10.0.1.0/24"
}
 
// private subnet variable
variable "private_subnet_cidr" {
 description = "Private Subnet CIDR values"
 default     = "10.0.4.0/24"
}

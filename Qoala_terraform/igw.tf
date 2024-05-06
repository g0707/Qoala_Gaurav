//Internet Gateway creation and associating it with the vpc

resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.main.id
 
 tags = {
   Name = "Project VPC IG"
 }
}
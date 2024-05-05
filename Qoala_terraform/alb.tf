resource "aws_lb" "my_alb" {
 name               = "public-alb"
 internal           = false
 load_balancer_type = "application"
 security_groups    = ["${aws_security_group.private_instance_sg.id}"]
 subnets            = [aws_subnet.public_subnets.id,aws_subnet.public_subnets_2.id]

 tags = {
   Environment = "public-alb"
 }
}
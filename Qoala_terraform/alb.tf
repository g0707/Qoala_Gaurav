resource "aws_lb" "my_alb" {       // Application Load balancer creation in public subnets
 name               = "public-alb"
 internal           = false
 load_balancer_type = "application"
 security_groups    = ["${aws_security_group.private_instance_sg.id}"]
 subnets            = [aws_subnet.public_subnets.id,aws_subnet.public_subnets_2.id]

 tags = {
   Environment = "public-alb"
 }
}


resource "aws_lb_listener" "front_end" {       // Listener Configuration of load balancer listening on port 80 for HTTP
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg_a.arn
  }
}



resource "aws_lb_target_group" "my_tg_a" { // Target Group Creation for Load balancer
 name     = "target-group-a"
 port     = 80
 protocol = "HTTP"
 vpc_id   = aws_vpc.main.id
}


resource "aws_lb_target_group_attachment" "tg_attachment_a" {    // Attaching private instance created in private subnet to be associated with target group
 target_group_arn = aws_lb_target_group.my_tg_a.arn
 target_id        = aws_instance.private_instance.id
 port             = 80
}
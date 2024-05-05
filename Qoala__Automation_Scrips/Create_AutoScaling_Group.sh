#!/bin/bash

aws autoscaling create-auto-scaling-group --auto-scaling-group-name \
 cpu_utilisation_autoscaling_group --launch-template \
 "LaunchTemplateName=gaurav-ec2-template" --min-size 2 --max-size \
 4 --desired-capacity 3 --availability-zones "us-east-1a" "us-east-1b" "us-east-1c"


#!/bin/bash


echo -e "Enter 1 for creating launch template\n"
echo -e "Enter 2 for creating auto-scaling-group for the launch template created from step 1\n"
echo -e "Enter 3 for creating autoscaling policy for cpu utilisation\n"
echo -e "Enter 4 for creating Cloudwatch alarm for cpu utilization above 60... %\n"
read a

case $a in
  1)
  #create a launch configuration that specifies the configuration details for the EC2 instances in your Auto Scaling group
   aws ec2 create-launch-template --launch-template-name gaurav-ec2-template \
    --version-description version1 --launch-template-data '{"ImageId":"ami-07caf09b362be10b8","InstanceType":"t2.micro"}';;

  2)
  # Create the Auto Scaling group and specify the launch configuration, minimum and maximum size, desired capacity, VPC settings, and other configurations.
   aws autoscaling create-auto-scaling-group --auto-scaling-group-name \
   cpu_utilisation_autoscaling_group --launch-template \
   "LaunchTemplateName=gaurav-ec2-template" --min-size 2 --max-size \
   4 --desired-capacity 3 --availability-zones "us-east-1a" "us-east-1b" "us-east-1c";;

  3)
  # Creating Autoscaling policy for cpu utilization
  aws autoscaling put-scaling-policy \
  --auto-scaling-group-name cpu_utilisation_autoscaling_group \
  --policy-name cpu-scaling-policy \
  --policy-type TargetTrackingScaling \
  --target-tracking-configuration file://cpu-scaling-config.json ;;

  4)
   #CloudWatch Alarm for CPU Threashold reaches above 60 %
   aws cloudwatch put-metric-alarm \
  --alarm-name cpu-utilization-alarm \
  --alarm-description "Alarm when CPU utilization exceeds 60%" \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --dimensions "Name=AutoScalingGroupName,Value=cpu_utilisation_autoscaling_group" \
  --period 300 \
  --threshold 60 \
  --comparison-operator GreaterThanThreshold \
  --evaluation-periods 1 \
  --alarm-actions "arn:aws:cloudwatch:us-east-1:905418163295:alarm:TargetTracking-cpu_utilisation_autoscaling_group-AlarmHigh-a2119e6d-5795-4b8d-9f4e-a7e67d551c73"
   ;;
  *)
  echo "Enter valid input";;
esac














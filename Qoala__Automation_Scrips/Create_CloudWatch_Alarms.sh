#!/bin/bash

#CloudWatch Alarm for scale out
aws cloudwatch put-metric-alarm \
    --alarm-name SimpleScalingAlarmHighAddCapacity \
    --metric-name CPUUtilization \
    --namespace AWS/EC2 --statistic Average \
    --period 180 --evaluation-periods 3 --threshold 70 \
    --comparison-operator GreaterThanOrEqualToThreshold \
    --dimensions "Name=cpu_utilisation_autoscaling_group, Value=cpu_utilisation_autoscaling_group" \
    --alarm-actions "arn:aws:autoscaling:us-east-1:905418163295:scalingPolicy:72219f14-efde-4388-bbc2-b96ac8fb279b:autoScalingGroupName/cpu_utilisation_autoscaling_group:policyName/scale-out-policy"



    #CloudWatch Alarm for scale in
aws cloudwatch put-metric-alarm \
    --alarm-name SimpleScalingAlarmHighRemoveCapacity \
    --metric-name CPUUtilization \
    --namespace AWS/EC2 --statistic Average \
    --period 180 --evaluation-periods 3 --threshold 50 \
    --comparison-operator LessThanOrEqualToThreshold \
    --dimensions "Name=cpu_utilisation_autoscaling_group, Value=cpu_utilisation_autoscaling_group" \
    --alarm-actions "arn:aws:autoscaling:us-east-1:905418163295:scalingPolicy:0b82fd36-de98-4f6d-bc01-c60d828f0a33:autoScalingGroupName/cpu_utilisation_autoscaling_group:policyName/scale-in-policy"
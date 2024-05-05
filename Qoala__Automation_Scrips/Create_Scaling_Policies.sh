#!/bin/bash

# scale out policy
aws autoscaling put-scaling-policy \
  --auto-scaling-group-name cpu_utilisation_autoscaling_group \
  --policy-name scale-out-policy \
  --policy-type SimpleScaling \
  --adjustment-type ChangeInCapacity \
  --scaling-adjustment 1


#Scale in policy
aws autoscaling put-scaling-policy \
    --policy-name scale-in-policy \
    --auto-scaling-group-name cpu_utilisation_autoscaling_group \
    --scaling-adjustment -1 \
    --adjustment-type ChangeInCapacity \
    --cooldown 180

#!/bin/bash

   aws ec2 create-launch-template --launch-template-name gaurav-ec2-template \
    --version-description version1 --launch-template-data '{"ImageId":"ami-07caf09b362be10b8","InstanceType":"t2.micro"}'
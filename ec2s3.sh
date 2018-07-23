#!/bin/bash
# region="us-east-1"
# Instance settings
# image_id="ami-b70554c8"
# ssh_key_name="sagarkey"
# instance_type="t2.micro"
# subnet_id="subnet-de0385f2"
# count=1
keypair="sagarkey.pem"
echo "Creating Instance which will download file from s3 bucket while launching"
id=$(aws ec2 run-instances --iam-instance-profile Name=FullAccess --image-id ami-b70554c8 --count 1 --instance-type t2.micro --key-name sagarkey --subnet-id subnet-de0385f2 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=pe_96_1}]" --region us-east-1 --query 'Instances[*].InstanceId' --output text --user-data file://inst.txt)  #creating instance pe_96_1 which will download file from s3 bucket
echo $id  #Displaying id
aws ec2 describe-instances --instance-id $id > inst_details.json #storing instance details in json file
echo "Waiting for ec2 instance to initialize"
sleep 8m
echo "Done"

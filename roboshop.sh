#!/bin/bash
AMI=ami-0b4f379183e5706b9
SG_ID=sg-05a37f712512f2d63
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
ZONE_ID=Z0576904QSLDCSU67T62
DOMAIN_NAME="sowjanyaaws.online"
for i in "${INSTANCES[@]}"
do
if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
then
INSTANCE_TYPE="t3.small"
else
INSTANCE_TYPE="t2.micro"
fi
IP_ADDRESS=$(aws ec2 run-instances --image-id $AMI --instance-type $INSTANCE_TYPE --security-group-ids $SG_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PrivateIpAddress' --output text)
echo "$i: $IP_ADDRESS"
 
aws route53 change-resource-record-sets \
  --hosted-zone-id $ZONE_ID \
  --change-batch '
  {
    "Comment": "Testing creating a record set"
    ,"Changes": [{
      "Action"              : "CREATE"
      ,"ResourceRecordSet"  : {
        "Name"              : "'$i'.'$DOMAIN_NAME'"
        ,"Type"             : "A"
        ,"TTL"              : 1
        ,"ResourceRecords"  : [{
            "Value"         : "'$IP_ADDRESS'"
        }]
      }
    }]
  }
  '
  done

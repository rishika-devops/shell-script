#!/bin/bash
DISK_USAGE=$(df -hT | grep -i xfs)
DISK_THRESHOLD=1
message=""
while IFS= read line
do
USAGE=$(echo $line | awk '{print $6F}' | cut -d % -f1)
partition=$(echo $line | awk '{print $1F}')
if [ $USAGE -ge $DISK_THRESHOLD ]
then
message+= "high disk usage on $partition:$usage <br>"
fi
done <<< $DISK_USAGE
echo "message: $message"
sh mail.sh "devops team" "high disk usage" "$message" "jujjurisowjanya@gmail.com" "alert high disk usage"




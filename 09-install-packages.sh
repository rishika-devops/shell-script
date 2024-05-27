#!/bin/bash
ID=$(id -u)
if [ $ID != 0 ]
then
echo "u r not a root user"
exit 1
else 
echo "u r a root user"
fi
yum install git -y


#!/bin/bash
ID=$(id -u)
if [ $ID != 0 ]
then
echo "u r not a root user"
else 
echo "u r a root user"
yum install git -y
fi


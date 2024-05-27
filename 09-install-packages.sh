#!/bin/bash
ID=$(id -u)
if [ $ID != 0 ]
then
echo "u r not a root user"
else 
echo "u r a root user"
fi
yum install git -y
if [ $? == 0 ]
then
echo "git is installed successfully"
else
echo "git is not installed successfully"
fi
yum install mysql -y
if [ $? == 0 ]
then
echo "mysql is installed successfully"
else
echo "mysql is not installed successfully"
fi


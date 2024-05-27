#!/bin/bash
ID=$(id -u)
if [ $ID != 0 ]
then
echo "u r not a root user"
else 
echo "u r a root user"
fi
validate() {
if [ $1 == 0 ]
then
echo "$2 is installed successfully"
else
echo "$2 is not installed successfully"
fi
}
yum install git -y
validate $? "installing git...."
yum install mysql -y
validate $? "installing mysql...."

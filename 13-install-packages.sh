#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log
echo "script started executing at $TIMESTAMP"
echo "arguments passed: $@"
validate() {
    if [ $1 -ne 0 ]
    then
    echo -e "$R $2 is failed $N"
    else
    echo -e "$G $2 is successful $N"
}

ID=$(id -u)
if[ $? -ne 0 ]
then 
echo -e "$R error::pls run with root access $N"
exit 1
else
echo "u r a root user"
fi

for package in $@
do
yum list installed $package  &>> $LOGFILE
if[ $? -ne 0 ]
then 
echo -e "$R $package is not installed"
yum install $package -y &>> $LOGFILE
validate $? "installing $package"
else
echo -e "$Y $package is already installed"
fi
done

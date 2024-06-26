#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
ID=$(id -u)
if [ $ID != 0 ]
then
echo -e "$R u r not a root user $N"
exit 1
else 
echo "u r a root user"
fi
validate() {
if [ $1 == 0 ]
then
echo -e "$G $2 is  successful"
else
echo -e "$R  $2 is not  successful $N"
fi
}
yum install git -y &>> $LOGFILE
validate $? "installing git...."
yum install mysql -y &>> $LOGFILE
validate $? "installing mysql...." 



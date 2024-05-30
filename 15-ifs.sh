#!/bin/bash
FILE=/etc/passwd
if [ ! -f $FILE ]
then
echo "$FILE doesnot exists"
fi
while IFS=":" read -r username password user_id
do
echo "username: $username"
echo "password: $password"
echo "user-id: $user_id"
done < $FILE
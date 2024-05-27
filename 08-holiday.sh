#!/bin/bash
TODAY=$1
if [ $TODAY == "sunday" ]
then 
echo "$TODAY is holiday"
else
echo "$TODAY is not a holiday"
fi
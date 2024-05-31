#!/bin/bash
NAME=""
WISHES="good morning"
USAGE(){
    echo "usage:: $(basename $0) -n name -w wishes"
    echo "options::"
    echo "-n, specify the name(name is mandatory)"
    echo "-w, specify thewishes(wishes optional) default is good morning"
    echo "-h, display help and exit"
}
while getopts ":n:w:h" opt; do
      case $opt in
        n ) NAME="$OPTARG";;
        w ) WISHES="$OPTARG";;
        \?) echo "Invalid option: -"$OPTARG"" >&2 ; USAGE; exit;;
        : ) USAGE; exit;;
        h ) USAGE; exit;;
      esac
    done
if [  -Z "$NAME" ] ;
then 
echo "error:: -n: name is mandatory"
USAGE
exit 1
fi
echo " hello $NAME........$WISHES.....r u leaning devops"
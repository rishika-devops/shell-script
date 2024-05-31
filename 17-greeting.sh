NAME=""
WISHES="good morning"
USAGE(){
    SCRIPT=$(basename $0)
    echo "$SCRIPT :: USAGE"
    echo "-n name(name is mandatory)"
    echo "-w wishes(wishes optional)"
}
while getopts ":n:w:h" opt; do
      case $opt in
        a ) NAME="$OPTARG";;
        b ) WISHES="$OPTARG";;
        h|* ) CHERRY="$OPTARG";;
        \?) echo "Invalid option: -"$OPTARG"" >&2
            exit 1;;
        : ) echo "Option -"$OPTARG" requires an argument." >&2
            exit 1;;
      esac
    done
if [ ! -n NAME ]
then 
echo "-n: name is mandatory"
fi
echo " hello $NAME........$WISHES.....r u leaning devops"
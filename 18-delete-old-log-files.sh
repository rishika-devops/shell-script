#!/bin/bash
SOURCE_DIR=""
OPTION=""
DESTINATION_DIR=""
NO_OF_DAYS="14"
memory_in_mb=""
CHANGE_DIR=$(cd /$SOURCE_DIR)
USAGE(){
    echo "USAGE:: $(basename $0) -s <source_dir> -a <archieve/delete> -d <destination-dir> -t <no_of_days> -m <memory_in_mb>"
    echo "options::"
    echo "-s, specify the source directory"
    echo "-a, specify the option archieve or delete"
    echo "-d, specify the destination directory"
    echo "-t, specify no.of days(which is optional)"
    echo "-m, specify the memory"
}
while getopts ":s:a:d:t:m:" opt; do
      case $opt in
        a ) SOURCE_DIR="$OPTARG";;
        b ) OPTION="$OPTARG";;
        c ) DESTINATION_DIR="$OPTARG";;
        d ) NO_OF_DAYS="$OPTARG";;
        e ) memory_in_mb="$OPTARG";;
        \?) echo "Invalid option: -"$OPTARG"" >&2
            exit 1;;
        : ) echo "Option -"$OPTARG" requires an argument." >&2
            exit 1;;
      esac
    done
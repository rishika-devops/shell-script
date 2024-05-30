#!/bin/bash
SOURCE="/tmp/shellscript-logs"
if [ ! -d "$SOURCE" ]; then
  echo "$SOURCE does not exist"
fi
FILES_TO_DELETE=$(find $SOURCE -type f -mtime +14 -name "*.log")
while IFS= read -r line
do
echo "deleting file: $line"
#rm -rf $line
done <<< $FILES_TO_DELETE

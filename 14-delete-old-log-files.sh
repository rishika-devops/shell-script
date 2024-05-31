#!/bin/bash
SOURCE="/tmp/shellscript"
if [ ! -d "$SOURCE" ]; then
  echo "$SOURCE does not exist"
fi
FILES_TO_DELETE=$(find $SOURCE -type f -mtime +14 -name "*.log")
#Internal Field Separator. It is a special environment variable that determines how the shell splits words into fields or tokens. The default value of IFS is whitespace (space, tab, and newline), which means that by default, the shell splits words at these whitespace characters
while IFS= read -r line
do
echo "deleting file: $line"
rm -rf $line
done <<< $FILES_TO_DELETE

#!/bin/bash
to_team=$1
Alert_type=$2
BODY=$3
ESCAPE_BODY=$(printf '%s\n' "$BODY" | sed -e 's/[]\/$*.^[]/\\&/g');
TO_ADDRESS=$4
SUBJECT=$5
FINAL_BODY=$(sed -e "s/to_team/$to_team/g" -e "s/Alert_type/$Alert_type/g" -e "s/BODY/$ESCAPE_BODY/g" template.html)
echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\n content_Type: text/html")" "$TO_ADDRESS"
#!/bin/bash
#Add text in the top file and in the end.

echo -e "Date: `date '+%Y-%m-%d %H:%M:%S.%3N'` milliseconsds
$(cat $1)" > $1;
echo "Date: $(date '+%Y-%m-%d %H:%M:%S.%3N') milliseconsds" >> $1

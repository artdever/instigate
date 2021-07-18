#!/bin/bash

echo "File: $1 --- Time: $(date)." >> report.log
cat $1 >> report.log
echo "####################################################" >> report.log
echo $date >> report.log

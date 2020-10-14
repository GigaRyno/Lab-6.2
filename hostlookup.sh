#!/bin/bash

#file name hostlookup.sh
#brief Editing scripts for lab 6.2
# Author Ryan LaVigne
# date 10/13/2020

file=${1}
if [ -f ${file} ]; then
while read p; 
do
    out=$(host -W1 -t A $p)
    if [ $? -eq 0 ];then
        ip=$(echo $out | cut -d " " -f 4)
       echo ${p}, $ip
    else
        echo "${p}, not found"
    fi
done <${file}
else
    echo "File doesnt exist"
    exit 1
fi
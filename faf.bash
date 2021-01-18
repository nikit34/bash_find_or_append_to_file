#!/bin/bash

FILE="./test.txt"
#"/etc/resolv.conf"


find_or_append () {
    if grep -q -x "$*" "$FILE"; then
        echo "$*" '- was already' 
    else
        echo "$*" >> $FILE
    fi
}

chmod o+x $FILE

if [ $# -eq 0 ]
  then
    LINE_1='nameserver 81.19.73.11'
    LINE_2='nameserver 81.19.83.11'
    LINE_3='nameserver 192.168.1.254'
    
    find_or_append $LINE_1
    find_or_append $LINE_2
    find_or_append $LINE_3
  else
    find_or_append $#
fi

chmod -r-- $FILE

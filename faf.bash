#!/bin/bash

FILE="/etc/resolv.conf"

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
    declare -a LINES=('nameserver 81.19.73.11' 'nameserver 81.19.83.11' 'nameserver 192.168.1.254')

    for LINE in "${LINES[@]}"
    do
        echo "$LINE"
        find_or_append $LINE
    done
    
  else
    find_or_append $#
fi

chmod -r-- $FILE

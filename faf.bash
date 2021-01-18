

FILE="./test.txt"
#"/etc/resolv.conf"
chmod o+x $FILE



find_or_append () {
    if ! grep -q $1 "$FILE"; then
        echo $1 >> $FILE
    else
        echo $1 ' - was already' 
    fi
}

if [ $# -eq 0 ]
  then
    LINE_1='nameserver 81.19.73.11'
    LINE_2='nameserver 81.19.83.11'
    LINE_3='nameserver 192.168.1.254'
    
    find_or_append LINE_1
    if ! grep -q 'nameserver 81.19.83.11' "$FILE"; then
        echo 'nameserver 81.19.83.11' >> $FILE
        else
            echo 'no'
    fi
    if ! grep -q 'nameserver 192.168.1.254' "$FILE"; then
        echo 'nameserver 192.168.1.254' >> $FILE
        else
            echo 'no'
    fi
fi


chmod -r-- $FILE

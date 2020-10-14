#!/bin/bash

usage()
{
    echo "$0 usage: [-f input filed] [-c U(pper) or L(ower)]"
    exit 1
}

while getopts ":f:c:" options;
do
    case "${options}" in
        f)
            f=${OPTARG}
            if [ -f $f ]; then
                echo "File exist"
            else
                echo "File doesnt exist"
            fi
            #TO DO IF FILE IS HERE, YAY! IF NOT USAGE
        ;;
        c)
            c=${OPTARG}
            if [[ ${c} == "U" || ${c} == "L" ]]; then
                echo "${f} - ${c}"
            else
                usage
            fi
        ;;
        *)
        usage
        ;;
    esac
done

while read line
do
    if [ ${c} == "U" ]; then
        echo $line | tr [:lower:] [:upper:]
    else
        echo $line | tr [:upper:] [:lower:]
    fi
done < $f

exit 0
#!/bin/bash
cat /tmp/old-cups/more-printer-info.txt | (

    while read line; do
        # Read data from file
        q=$(echo ${line} | awk '{print $3}' | sed -e 's/://')
        v=$(echo ${line} | awk '{print $NF}')
        read line;
        d=$(echo ${line} | sed -e 's/^.*Description: //')
        read line;
        l=$(echo ${line} | sed -e 's/^.*Location: //')

        # Look for the PPD file
        if [ -e /tmp/old-cups/${q}.ppd ]; then
            p="-P /tmp/old-cups/${q}.ppd"
        else
            p=""
        fi

        # Create the lpadmin command:
        echo lpadmin -p "${q}" ${p} -v ${v} -D \"${d}\" -L \"${l}\" -E
    done
)

lpstat -p | egrep -o '^printer [^ ]+' | sed -e 's/^printer //' | ( while read q; do lpstat -v $q; lpstat -l -p $q | egrep '(Description)|(Location)'; done) > more-printer-info.txt

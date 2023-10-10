#!/bin/bash

# Enforcing 2 Arguments  
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input.xml output.xls"
    exit 1
fi

input_file="$1"
output_file="$2"

# Run ssconvert inside the container. Docker can be replaced wth Podman, works the same.
# running it for the first time might take few minutes as it have to Download the image from quay.io registry. 

docker run --rm -v "$(pwd):/docs" quay.io/thabane/gnumeric:v1.0 \
    ssconvert "$input_file" "$output_file"


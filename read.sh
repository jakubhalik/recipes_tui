#!/bin/bash

if [ -z "$1" ]; then
    read -p "Enter filename: " file
else
    file="$1"
fi

while IFS= read -r line; do
    echo "$line"
    if [[ "$line" =~ \<img\  ]]; then
        img_src=$(echo "$line" | grep -o 'src="[^"]*' | sed 's/src="//')
        catimg -w 90 "$img_src"
    fi
done < "$file"


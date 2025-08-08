#!/bin/bash

if [ -z "$1" ]; then
    read -p "Enter filename: " file
else
    file="$1"
fi

while IFS= read -r line; do
    #echo "$line"
    if [[ "$line" =~ \<img\  ]]; then
        img_src=$(echo "$line" | grep -o 'src="[^"]*' | sed 's/src="//')
        #catimg -w 90 "$img_src"
        #echo $img_src
        if [[ "$img_src" == /* ]]; then
                img_src="${img_src#/}"
        fi
        break
    fi
done < "$file"
./side_by_side.sh "echo \"\$(w3m -T text/html $file)\"" "kitty +kitten icat --place 90x21@60x1 $img_src"

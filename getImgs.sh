#!/bin/bash
read -p "enter filename: " file
grep -o '<img [^>]*src="[^"]*' "$file" | sed 's/<img [^>]*src="//' > image_urls
while read img; do
    curl -O --proxy socks5h://localhost:9050 https://based.cooking"$img"
    # if [[ "$img_filename" == *.webp ]]; then
    #     dwebp "$img_filename" -o "${img_filename%.webp}.png"
    #     rm "$img_filename"
    # fi
done < image_urls
rm image_urls


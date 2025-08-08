#!/bin/bash
curl --proxy socks5h://localhost:9050 https://based.cooking/"$1"/; curl --proxy socks5h://localhost:9050 https://based.cooking/"$1"/> "$1"; ./getImgs.sh "$1"; ./read.sh "$1"



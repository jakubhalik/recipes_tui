#!/bin/bash
recipe=$1
pic=$2
./side_by_side.sh "echo \"\$(w3m -T text/html $recipe)\"" "kitty +kitten icat --place 90x21@60x1 $pic"

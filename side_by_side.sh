#!/bin/bash
cmd1="$1"
cmd2="$2"

mapfile -t left < <(eval "$cmd1")
mapfile -t right < <(eval "$cmd2")

max_lines=${#left[@]}
if (( ${#right[@]} > max_lines )); then
  max_lines=${#right[@]}
fi

max_left=0
for l in "${left[@]}"; do
  (( ${#l} > max_left )) && max_left=${#l}
done

for ((i=0; i<max_lines; i++)); do
  printf "%-*s │ %s\n" "$max_left" "${left[i]}" "${right[i]}"
done

#!/bin/bash
tmux split-window -h
recipe=$1
pic=$2
tmux send-keys -t 0 "echo \"\$(w3m -T text/html ${recipe})\"" C-m
tmux send-keys -t 1 "kitty +kitten icat ${pic}" C-m

#!/bin/sh

i=1
for a in "$@"
do
printf "%s:\"%s\"\n" $i "$a"
i=$((i+1))
done

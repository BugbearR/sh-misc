#!/bin/sh

# License: CC0-1.0

i=1
for a in "$@"
do
printf '%s:"%s"\n' $i "$a"
i=$((i+1))
done

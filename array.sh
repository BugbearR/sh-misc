# Set value to array
# @param $1 array name
# @param $2 index (start from 1)
# @param $3 value
array_put() {
    eval "$1_$2=\"$3\""
}

# Get value from array
# @param $1 array name
# @param $2 index (start from 1)
array_get() {
    eval "printf \"%s\" \"\${$1_$2}\""
}

# Get count of array
# @param $1 array name
array_count() {
    set | grep "^$1_[0-9]*=" | wc -l
}

# Save $@ to array
# Sample code
# $@ is local variable in function. So, we can't define common function.
#
# i=1
# for a in "$@"
# do
#     eval "YOURVAR_$i=\"$a\""
#     i=$((i+1))
# done

# Get list of array
# @param $1 array name
#
# How to use
# eval "set -f -- "$(array_list YOURVAR)
array_list() {
    array_list_N=$(array_count $1)
   
    array_list_LIST=
    for array_list_i in $(seq $array_list_N)
    do
    	array_list_LIST="$array_list_LIST "\"\$$1_$array_list_i\"
    done
    printf "%s" "$array_list_LIST"
    unset array_list_N
    unset array_list_LIST
    unset array_list_i
}

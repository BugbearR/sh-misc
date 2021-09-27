# License: CC0-1.0

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

# Put all values to array
# @param $1 array name
# @param $2... values
#
# How to use
# array_put_all YOURVAR "$@"
array_put_all() {
    array_put_all_VAR=$1
    shift
    array_put_all_i=1
    for array_put_all_item in "$@"
    do
        eval "${array_put_all_VAR}_${array_put_all_i}=\"$array_put_all_item\""
        array_put_all_i=$((array_put_all_i + 1))
    done
    unset array_put_all_VAR array_put_all_i array_put_all_item
}

# Get list of array
# @param $1 array name
#
# How to use
# eval "set -f -- "$(array_list YOURVAR)
array_list() {
    array_list_N=$(array_count $1)
   
    array_list_LIST=
    array_list_i=1
    while [ $array_list_i -le $array_list_N ]
    do
    	array_list_LIST="$array_list_LIST "\"\$$1_$array_list_i\"
        array_list_i=$((array_list_i + 1))
    done
    printf "%s" "$array_list_LIST"
    unset array_list_N array_list_LIST array_list_i
}

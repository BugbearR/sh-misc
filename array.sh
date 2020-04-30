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
# @param $1 array name
# @param $2... 
#
# How to use
# array_save YOURVAR "$@"
array_save() {
    array_save_VAR=$1
    shift
    array_save_i=1
    for array_save_item in "$@"
    do
        eval "${array_save_VAR}_${array_save_i}=\"$array_save_item\""
        array_save_i=$((array_save_i+1))
    done
    unset array_save_VAR array_save_i array_save_item
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
    unset array_list_N array_list_LIST unset array_list_i
}

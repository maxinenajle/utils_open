#!/bin/bash

# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# # this is only supposed to run with an error - commenting out for now
# # echo an error message before exiting
# trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

link="tree"



### long opts - not working

# VALID_ARGS=$(getopt -o c --long commits -- "$@")
# if [[ $? -ne 0 ]]; then
#     exit 1;
# fi

# eval set -- "$VALID_ARGS"
# while [ : ]; do
#   case "$1" in
#     -c | --commits)
#         link="commits"
#         shift
#         ;;
#     --) shift; 
#         break 
#         ;;
#   esac
# done


# using getopts short instead:
while getopts 'ch' opt; do
  case "$opt" in
    c)
      link="commits"
      ;;
    ?|h)
      echo "Usage: $(basename $0) [-c]"
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

### get url:
raw=`git ls-remote --get-url origin`
host=`echo $raw | sed 's|^git@|https://|g'`

# host="${raw:4}"
host="${host%.git}"
host=`echo $host | sed 's|.com:|.com/|g'`
# branch_raw=`git branch | grep \*`
# branch="${branch_raw:2}"
branch=`git branch --show-current`
url="$host/$link/$branch"

### print and copy url
echo $url
echo $url | pbcopy


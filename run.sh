#!/bin/bash

# Read filename and extract extension
if [[ $# -ne 1 ]] ; then
  echo "Please provide a file:"
  echo "$0 <path to file>"
  exit 1
fi
FILE=$1 
EXT="${FILE##*.}"

# run file
case $EXT in
  "py") # Python
    python3 $1
    ;;
  "c") # C
    gcc -std=c99 -Wall -Wextra -Wpedantic -Werror $1 -o tmp && \
      ./tmp && \
      rm tmp
    ;;  
  "cpp") # C++
    g++ --std=c++11 -Wall -Wextra -Wpedantic -Werror $1 -o tmp && \
      ./tmp && \
      rm tmp
    ;; 
  "hs") # Haskell
    runhaskell $1
    ;;
  "go") # Golang
    go run $1
    ;;
  "ts")
    ts-node $1
    ;;
  "js")
    node $1
    ;;
  *) # anything else
    echo "Unexpected file extension: $EXT"
    exit 1
    ;;
esac
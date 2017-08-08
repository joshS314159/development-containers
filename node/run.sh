#!/bin/bash

set -e; # exit all shells if script fails
set -u; # exit script if uninitialized variable is used
set -o pipefail; #exit script if anything fails in pipe
# set -x; #debug mode



declare -r ARGS="$@"
declare -r PROGRAM="$0"


function read_parameters(){
    local input=""
    
    while getopts ":i" opt; do
      case "${opt}" in
        i ) input="$2"
            shift 2;;
        \? );;
      esac
    done
    readonly INPUT="$input"
}


function run(){
    local working_dir="$HOME/Documents/Developer/Working:/Working"
    docker run -it -v "$working_dir" node:latest "node" $INPUT
}


function main(){
    read_parameters $ARGS
    run
}
main



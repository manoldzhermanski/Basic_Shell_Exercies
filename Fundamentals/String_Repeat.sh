#!/bin/bash

string_repeat () 
{
    repeat=$1
    string=$2
    local result=""
    while [ "$repeat" -gt 0 ];
    do
        result+="$string"
        repeat=$((repeat - 1))

    done

    echo "$result"
}

string_repeat 4 'a'
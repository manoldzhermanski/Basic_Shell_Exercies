#!/bin/bash

prod2sum () {
    # Given 4 integers a, b, c, d,
    # we form the sum of the squares of a and b and then the sum of the squares of c and d. 
    # We multiply the two sums hence a number n and we try to decompose n in a sum of two squares e and f
    # (e and f integers >= 0) so that n = e² + f².
    

    # Define parameters
    local a="$1"
    local b="$2"
    local c="$3"
    local d="$4"

    # Find the possible solutions, this is a classical number theory problem.
    # The solutions are given by the following formulas:
    # (a² + b²)(c² + d²) = (ac − bd)² + (ad + bc)² = (ac + bd)² + (ad − bc)²

    local x1=$((a * c - b * d))
    local y1=$((a * d + b * c))

    local x2=$((a * c + b * d))
    local y2=$((a * d - b * c))

    # Take abosolute values
    local e1=$((x1 < 0 ? -x1 : x1))
    local f1=$((y1 < 0 ? -y1 : y1))

    # Ensure e1 is less than or equal to f1
    if [ $e1 -gt $f1 ];
    then
        local temp=$e1
        e1=$f1
        f1=$temp
    fi

    # Take absolute values
    local e2=$(($x2 < 0 ? -x2 : x2))
    local f2=$(($y2 < 0 ? -y2 : y2))

    # Ensure e2 is less than or equal to f2
    if [ $e2 -gt $f2 ];
    then
        local temp=$e2
        e2=$f2
        f2=$temp
    fi

    # If there is one solution, we return it.
    # If there are two solutions, we return the one with the smallest e.
    # If e's are equal, we return the one with the smallest f.
    if [ $e1 -eq $e2 ] && [ $f1 -eq $f2 ];
    then
        echo "[[$e1, $f1]]"
    else
        if [ $e1 -gt $e2 ] || ([ $e1 -eq $e2 ] && [ $f1 -gt $f2 ])
        then
            echo "[[$e2, $f2], [$e1, $f1]]"
        else
            echo "[[$e1, $f1], [$e2, $f2]]"
        fi
    fi
}

prod2sum 1 2 1 3
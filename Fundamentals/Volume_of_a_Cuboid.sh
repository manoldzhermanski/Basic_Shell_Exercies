#!/bin/bash

cuboid_volume ()
{
    length=$1
    width=$2
    height=$3

    echo "$(echo "$length * $width * $height" | bc -l)"
}

cuboid_volume 1 2 3
cuboid_volume 6.3 3 5
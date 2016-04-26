#!/bin/bash
echo "ICE" $*
dest=$1
x=$(pwd)

cp Ice.min.js $dest/js

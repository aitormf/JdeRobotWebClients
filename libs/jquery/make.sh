#!/bin/bash
echo "jQuery" $*

dest=$1
wd=$(pwd)

cp jquery.min.js $dest/js

shift
while [ $# -gt 0 ]; do
  case $1 in
     flightindicators)
	  cp -r img $dest
	  cp jquery.flightindicators.js $dest/js
	  cp flightindicators.min.css $dest/css;;
  esac
  shift
done

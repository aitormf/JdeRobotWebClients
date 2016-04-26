#!/bin/bash
echo "Bootstrap" $*

dest=$1
wd=$(pwd)

cp js/bootstrap.min.js $dest/js
cp -r fonts $dest/
cp css/bootstrap.min.css $dest/css

shift
while [ $# -gt 0 ]; do
  case $1 in
     bootstrap-toggle)
	  cp js/bootstrap-toggle.min.js $dest/js
	  cp css/bootstrap-toggle.min.css $dest/css;;
  esac
  shift
done

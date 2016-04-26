#!/bin/bash

echo "JdeRobot" $*

dest=$1/js/jderobot
x=$(pwd)


if [ ! -d $dest ]
then 
  mkdir $dest
fi
cp *.js $dest


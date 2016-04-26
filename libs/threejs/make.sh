#!/bin/bash

echo "ThreeJS" $*

dest=$1
x=$(pwd)

cp three.min.js $dest/js

shift
while [ $# -gt 0 ]; do
  case $1 in
     colladaloader)
	  cp ColladaLoader.js $dest/js;;
     trackballcontrols)
	  cp TrackballControls.js $dest/js;;
     joystickcontrols)
	  cp JoyStickControls.js $dest/js;;
  esac
  shift
done

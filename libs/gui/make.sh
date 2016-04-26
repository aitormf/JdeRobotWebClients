#!/bin/bash

echo "GUI" $*
if [ "$1" == "-dev" ]; then
  dev=true
  shift
else
  dev=false
fi

dest=$1/js
guifile=$dest/gui.js
x=$(pwd)

shift

if $dev;
then
  
  while [ $# -gt 0 ]; do
    case $1 in
       control)
	    cp control/control.js $dest;;
       joystick)
	    cp joystick/joystick.js $dest;;
       robotloaders)
	    cp robotloaders/robotloaders.js $dest;;
    esac
    shift
  done
else
  #touch $apifile
  echo "var GUI = GUI || {};" > $guifile

  while [ $# -gt 0 ]; do
    echo "" >> $guifile
    case $1 in
       control)
	    sed 1d control/control.js >> $guifile;;
       joystick)
	    sed 1d joystick/joystick.js >> $guifile;;
       robotloaders)
	    sed 1d robotloaders/robotloaders.js >> $guifile;;
    esac
    shift
  done
fi

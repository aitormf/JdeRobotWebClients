#!/bin/bash

echo "API" $*
if [ "$1" == "-dev" ]; then
  dev=true
  shift
else
  dev=false
fi

dest=$1/js
workers=$dest/api_workers
apifile=$dest/api.js
x=$(pwd)

if [ ! -d $workers ]
then 
  mkdir $workers
fi

shift

if $dev;
then
  
  while [ $# -gt 0 ]; do
    case $1 in
       ardroneextra)
	    cp ardroneextra/ardroneextra.js $dest
	    cp ardroneextra/ardroneextra_worker.js $workers;;
       camera)
	    cp camera/camera.js $dest
	    cp camera/camera_worker.js $workers;;
       cmdvel)
	    cp cmdvel/cmdvel.js $dest
	    cp cmdvel/cmdvel_worker.js $workers;;
       laser)
	    cp laser/laser.js $dest
	    cp laser/laser_worker.js $workers;;
       motors)
	    cp motors/motors.js $dest
	    cp motors/motors_worker.js $workers;;
       pose3d)
	    cp pose3d/pose3d.js $dest
	    cp pose3d/pose3d_worker.js $workers;;
    esac
    shift
  done
else
  #touch $apifile
  echo "var API = API || {};" > $apifile

  while [ $# -gt 0 ]; do
    echo "" >> $apifile
    case $1 in
       ardroneextra)
	    sed 1d ardroneextra/ardroneextra.js >> $apifile
	    cp ardroneextra/ardroneextra_worker.js $workers;;
       camera)
	    sed 1d camera/camera.js >> $apifile
	    cp camera/camera_worker.js $workers;;
       cmdvel)
	    sed 1d cmdvel/cmdvel.js >> $apifile
	    cp cmdvel/cmdvel_worker.js $workers;;
       laser)
	    sed 1d laser/laser.js >> $apifile
	    cp laser/laser_worker.js $workers;;
       motors)
	    sed 1d motors/motors.js >> $apifile
	    cp motors/motors_worker.js $workers;;
       pose3d)
	    sed 1d pose3d/pose3d.js >> $apifile
	    cp pose3d/pose3d_worker.js $workers;;
    esac
    shift
  done
fi

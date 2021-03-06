#!/bin/bash
if [ "$1" == "-dev" ]; then
  dev=true
  shift
else
  dev=false
fi

dest=$1/uavviewerjs
wd=$(pwd)
depthr=(colladaloader trackballcontrols)
depice=()
depjdr=()
depjq=(flightindicators)
depboot=(bootstrap-toggle)
depapi=(camera cmdvel pose3d ardroneextra)
depgui=(robotloaders joystick)

echo "making uavvierwer"

if [ ! -d $dest ];
then 
  mkdir $dest
fi

cp -r * $dest
rm $dest/make.sh*


if ! $dev;
then
  # sustitucion de api
  ../../scripts/joinlib.sh $dest/uavviewer.html api.js uavviewer.js ${depapi[@]}
  #sustitucion de gui
  ../../scripts/joinlib.sh $dest/uavviewer.html gui.js uavviewer.js ${depgui[@]}
fi


cd ../../libs/threejs
./make.sh $dest ${depthr[@]}
cd $wd

cd ../../libs/bootstrap
./make.sh $dest ${depboot[@]}
cd $wd

cd ../../libs/jquery
./make.sh $dest ${depjq[@]}
cd $wd

cd ../../libs/jderobot
./make.sh $dest ${depjdr[@]}
cd $wd

cd ../../libs/ice
./make.sh $dest ${depice[@]}
cd $wd

if $dev;
then
  cd ../../libs/api
  ./make.sh -dev $dest ${depapi[@]}
  cd $wd

  cd ../../libs/gui
  ./make.sh -dev $dest ${depgui[@]}
  cd $wd
else
  cd ../../libs/api
  ./make.sh $dest ${depapi[@]}
  cd $wd

  cd ../../libs/gui
  ./make.sh $dest ${depgui[@]}
  cd $wd
fi




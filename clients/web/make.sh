#!/bin/bash
if [ "$1" == "-dev" ]; then
  dev=true
  shift
else
  dev=false
fi

dest=$1/web
wd=$(pwd)
depthr=(colladaloader trackballcontrols joystickcontrols)
depice=()
depjdr=()
depjq=(flightindicators)
depboot=(bootstrap-toggle)
depapi=(camera motors laser cmdvel pose3d ardroneextra)
depgui=(robotloaders joystick control)

echo "making JdeRobotWebClients"

cd ../..
./scripts/cameraview2web.sh
./scripts/rgbdviewer2web.sh
./scripts/kobukiviewer2web.sh
./scripts/uavviewer2web.sh
./scripts/introrobkobuki2web.sh
./scripts/introrobuav2web.sh
cd $wd


if [ ! -d $dest ];
then 
  mkdir $dest
fi

cp -r * $dest
rm $dest/make.sh*


if ! $dev;
then
  # sustitucion de api
  ../../scripts/joinlib.sh $dest/cameraview.html api.js cameraview.js ${depapi[@]}
  ../../scripts/joinlib.sh $dest/rgbdviewer.html api.js rgbdviewer.js ${depapi[@]}
  ../../scripts/joinlib.sh $dest/kobukiviewer.html api.js kobukiviewer.js ${depapi[@]}
  ../../scripts/joinlib.sh $dest/uavviewer.html api.js uavviewer.js ${depapi[@]}
  ../../scripts/joinlib.sh $dest/introrobkobuki.html api.js introrobkobuki.js ${depapi[@]}
  ../../scripts/joinlib.sh $dest/introrobuav.html api.js introrobuav.js ${depapi[@]}
  #sustitucion de gui
  ../../scripts/joinlib.sh $dest/rgbdviewer.html gui.js rgbdviewer.js ${depgui[@]}
  ../../scripts/joinlib.sh $dest/kobukiviewer.html gui.js kobukiviewer.js ${depgui[@]}
  ../../scripts/joinlib.sh $dest/uavviewer.html gui.js uavviewer.js ${depgui[@]}
  ../../scripts/joinlib.sh $dest/introrobkobuki.html gui.js introrobkobuki.js ${depgui[@]}
  ../../scripts/joinlib.sh $dest/introrobuav.html gui.js introrobuav.js ${depgui[@]}
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

cd ../../libs/progeo
./make.sh $dest 
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




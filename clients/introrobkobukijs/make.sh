#!/bin/bash
if [ "$1" == "-dev" ]; then
  dev=true
  shift
else
  dev=false
fi

dest=$1/introrobkobukijs
wd=$(pwd)
depthr=(colladaloader trackballcontrols joystickcontrols)
depice=()
depjdr=()
depjq=()
depboot=()
depapi=(camera motors pose3d laser)
depgui=(robotloaders control)

echo "making introrobkobuki"

if [ ! -d $dest ]
then 
  mkdir $dest
fi

cp -r * $dest
rm $dest/make.sh*

if ! $dev;
then
  # sustitucion de api
  ../../scripts/joinlib.sh $dest/introrobkobuki.html api.js introrobkobuki.js ${depapi[@]}
  #sustitucion de gui
  ../../scripts/joinlib.sh $dest/introrobkobuki.html gui.js introrobkobuki.js ${depgui[@]}
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

#!/bin/bash
if [ "$1" == "-dev" ]; then
  dev=true
  shift
else
  dev=false
fi

dest=$1/kobukiviewerjs
wd=$(pwd)
depthr=(colladaloader trackballcontrols joystickcontrols)
depice=()
depjdr=()
depjq=()
depboot=(bootstrap-toggle)
depapi=(camera motors pose3d laser)
depgui=(robotloaders control)

echo "making kobukiviewer"

if [ ! -d $dest ]
then 
  mkdir $dest
fi

cp -r * $dest
rm $dest/make.sh*

if ! $dev;
then
  # sustitucion de api
  ../../scripts/joinlib.sh $dest/kobukiviewer.html api.js kobukiviewer.js ${depapi[@]}
  #sustitucion de gui
  ../../scripts/joinlib.sh $dest/kobukiviewer.html gui.js kobukiviewer.js ${depgui[@]}
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

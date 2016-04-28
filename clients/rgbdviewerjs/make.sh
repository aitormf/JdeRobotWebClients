#!/bin/bash
if [ "$1" == "-dev" ]; then
  dev=true
  shift
else
  dev=false
fi


dest=$1/rgbdviewerjs
wd=$(pwd)
depthr=(trackballcontrols)
depice=()
depjdr=()
depjq=()
depboot=()
depapi=(camera)

echo "making rgbdviewer"

if [ ! -d $dest ]
then 
  mkdir $dest
fi

cp -r * $dest
rm $dest/make.sh*

if ! $dev;
then
  # sustitucion de api
  ../../scripts/joinlib.sh $dest/rgbdviewer.html api.js rgbdviewer.js ${depapi[@]}
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

else
  cd ../../libs/api
  ./make.sh $dest ${depapi[@]}
  cd $wd
fi

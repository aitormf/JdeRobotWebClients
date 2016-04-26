#!/bin/bash
if [ "$1" == "-dev" ]; then
  dev=true
  shift
else
  dev=false
fi


wd=$(pwd)
dest=$wd/build
np=$#
#echo $#
if (($np > 0))
then
  cli=$@
else
 cli=$(ls clients)
fi


#echo "main" $cli

for v in $cli
do
  cd clients/$v
  if $dev;
  then
   ./make.sh -dev $dest
  else
   ./make.sh $dest
  fi
  cd $wd
done

#a=("1" "2")

#echo ${a[@]} 

#clients/uavviewerjs/make.sh $dest

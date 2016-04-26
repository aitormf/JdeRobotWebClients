#!/bin/bash
  
d1=$1
shift
f=2
d2=$1$f
lib=$1
shift
pat=$1
shift

fin=".js/d"
in="/"
insc='\ \ \ <script src="js/'
finsc='"></script>'


for v in $@
do
  a=$in$v$fin
  sed $a $d1 > $d2
  cp $d2 $d1
done

b=$insc$lib$finsc
sed -e "/$pat/i $b" $d1 > $d2 
cp $d2 $d1
rm $d2

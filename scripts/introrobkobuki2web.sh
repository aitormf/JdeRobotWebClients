#!/bin/bash

wd=$(pwd)
name=introrobkobuki.html
orig=$wd/clients/introrobkobukijs
dest=$wd/clients/web

cp $orig/css/* $dest/css
cp $orig/js/* $dest/js

sed -e '/<header*/,/<.header/d' $orig/$name > $dest/back.html


data='<header id="header">\n  <nav class="navbar navbar-inverse" role="banner">\n    <div class="container">\n      <div class="navbar-header">\n        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>\n        <a class="navbar-brand" href="index.html"><i class="fa fa-bolt"></i> Jderobot Web Clients</a> </div>\n      <div class="collapse navbar-collapse navbar-right">\n        <ul class="nav navbar-nav">\n          <li><a href="index.html">Home</a></li>\n          <li ><a href="cameraview.html">Cameraview</a></li>\n          <li><a href="rgbdviewer.html">RGBDViewer</a></li>\n          <li><a href="kobukiviewer.html">KobukiViewer</a></li>\n          <li><a href="uavviewer.html">UavViewer</a></li>\n           <li class="active"><a href="introrobkobuki.html">IntrorobKobuki</a></li>\n           <li><a href="introrobuav.html">IntrorobUav</a></li>\n        </ul>\n      </div>\n    </div>\n    <!--/.container--> \n  </nav>\n  <!--/nav-->\n\n</header>'


sed -e "/<.--.header/i ${data}" $dest/back.html > $dest/$name
rm $dest/back.html

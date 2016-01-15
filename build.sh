#!/bin/bash -vx

# copy id and version from project.clj into config.xml
export APP_ID=`head -n 1 project.clj | sed -e 's/ *".*//' | sed -e 's/.* //' | sed -e 's/\\//./'`
export VERSION=`head -n 1 project.clj | sed -e 's/.* "//' | sed -e 's/".*//'`
perl -pi -e "s/widget id=\"[^\"]*\" version=\"[^\"]*/widget id=\"$APP_ID\" version=\"$VERSION/" config.xml 

# cleanup before building
killall java
lein clean 

# build
lein cljsbuild once dist 
cordova prepare
cordova build

# copy cordova-web
cp -a platforms/browser/www/cordova* .
cp -a platforms/browser/www/cordova* resources/public/

# Manifest file

#echo "CACHE MANIFEST" > index.appcache
#echo "# `date`" >> index.appcache
#find assets -type f >> index.appcache
#echo "index.js" >> index.appcache

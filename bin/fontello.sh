#!/bin/sh
unzip -u $1
if [ ! -d $2/vendor/assets/fonts ]; then
	mkdir $2/vendor/assets/fonts
fi 
cp -r $1/font/fontello.eot $2/vendor/assets/fonts
cp -r $1/font/fontello.svg $2/vendor/assets/fonts
cp -r $1/font/fontello.ttf $2/vendor/assets/fonts
cp -r $1/font/fontello.woff $2/vendor/assets/fonts

cp -f $1/config.json $2/vendor/assets/fonts/config.json

cp -f $1/css/fontello.css $2/app/assets/stylesheets/fontello.less
echo 'copy fontello successfully'

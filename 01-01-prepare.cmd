@echo off

set path=c:\cygwin64\bin;%path%
rm -rf c:\OSGeo4W64\apps\Qt5
cp -r c:\Qt\Qt5.10.1\5.10.1\msvc2015_64\ c:\OSGeo4W64\apps\
mv c:\OSGeo4W64\apps\msvc2015_64 c:\OSGeo4W64\apps\Qt5

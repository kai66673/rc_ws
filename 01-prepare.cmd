@echo off

cd /d %~dp0
if not exist "%CD%\packages" mkdir %CD%\packages

cd packages

set path=c:\cygwin64\bin;%path%

wget http://download.osgeo.org/osgeo4w/osgeo4w-setup-x86_64.exe
wget http://download.qt.io/official_releases/qt/5.10/5.10.1/qt-opensource-windows-x86-5.10.1.exe
wget https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.10.1/PyQt5_gpl-5.10.1.zip
wget https://sourceforge.net/projects/pyqt/files/QScintilla2/QScintilla-2.10.7/QScintilla_gpl-2.10.7.zip
wget https://sourceforge.net/projects/qwt/files/qwt/6.1.3/qwt-6.1.3.zip
wget https://datapacket.dl.sourceforge.net/project/pyqt/sip/sip-4.19.8/sip-4.19.8.zip
wget https://github.com/AnalyticalGraphicsInc/cesium/releases/download/1.47/Cesium-1.47.zip

cd ..

cd packages
osgeo4w-setup-x86_64.exe -k -A -R c:\OSGeo4W64 -P qgis-rel-dev,qgis-server
cd ..
cd OSGeo4W64

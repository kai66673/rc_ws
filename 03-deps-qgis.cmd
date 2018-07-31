@echo off

cd /d %~dp0
set RC_DIR=%CD%
if not exist "%RC_DIR%\dev" mkdir %RC_DIR%\dev

set path=c:\cygwin64\bin;%path%
unzip -qq %RC_DIR%\packages\PyQt5_gpl-5.10.1.zip 'PyQt5_gpl-5.10.1/sip/*' -d %RC_DIR%\packages
cp -r %RC_DIR%\packages\PyQt5_gpl-5.10.1\sip\ c:\OSGeo4W64\apps\Python36\
rm -rf %RC_DIR%\packages\PyQt5_gpl-5.10.1
cp c:\OSGeo4W64\bin\sip.exe c:\OSGeo4W64\apps\Python36\Scripts\
unzip -qq %RC_DIR%\packages\sip-4.19.8.zip 'sip-4.19.8/siplib/sip.h.in' -d %RC_DIR%\packages
cp %RC_DIR%\packages\sip-4.19.8\siplib\sip.h.in c:\OSGeo4W64\apps\Python36\include\sip.h
sed -i 's/@CFG_MODULE_NAME@/sip/' c:\OSGeo4W64\apps\Python36\include\sip.h 
rm -rf %RC_DIR%\packages\sip-4.19.8

unzip -qq %RC_DIR%\packages\QScintilla_gpl-2.10.7.zip -d %RC_DIR%\dev	
unzip -qq %RC_DIR%\packages\qwt-6.1.3.zip -d %RC_DIR%\dev

call %RC_DIR%\mcvc2015_qt5_env.cmd

echo Building qscintilla...
cd /d %RC_DIR%\dev\QScintilla_gpl-2.10.7\Qt4Qt5
if exist "%RC_DIR%\dev\QScintilla_gpl-2.10.7\Qt4Qt5\build" rm -rf %RC_DIR%\dev\QScintilla_gpl-2.10.7\Qt4Qt5\build
mkdir %RC_DIR%\dev\QScintilla_gpl-2.10.7\Qt4Qt5\build
cd /d %RC_DIR%\dev\QScintilla_gpl-2.10.7\Qt4Qt5\build
qmake ..
nmake release
nmake install
mv C:\OSGeo4W64\apps\Qt5\lib\qscintilla2_qt5.dll C:\OSGeo4W64\apps\Qt5\bin\

echo Building qwt...
cd /d %RC_DIR%S\dev\qwt-6.1.3
if exist "%RC_DIR%\dev\qwt-6.1.3\build" rm -rf %RC_DIR%\dev\qwt-6.1.3\build
mkdir %RC_DIR%\dev\qwt-6.1.3\build
cd /d %RC_DIR%\dev\qwt-6.1.3\build
qmake ..
nmake
nmake install
if not exist "C:\OSGeo4W64\apps\Qt5\include\qwt6" mkdir C:\OSGeo4W64\apps\Qt5\include\qwt6
cp c:/Qwt-6.1.3\include\*.* C:\OSGeo4W64\apps\Qt5\include\qwt6\
cv c:/Qwt-6.1.3/lib/*.dll C:\OSGeo4W64\apps\Qt5\bin\
cp c:/Qwt-6.1.3/lib/*.lib C:\OSGeo4W64\apps\Qt5\lib\
rm -rf c:\Qwt-6.1.3

cd /d %RC_DIR%\dev
if not exist "%RC_DIR%\dev\qca" git clone git://anongit.kde.org/qca.git
cd qca
echo Building qca...
if exist "%RC_DIR%\dev\qca\build" rm -rf %RC_DIR%\dev\qca\build
mkdir %RC_DIR%\dev\qca\build
cd /d %RC_DIR%\dev\qca\build
cmake -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:/OSGeo4W64/apps/Qt5 -DCMAKE_BUILD_TYPE=Release ..
nmake
nmake install

cd /d %RC_DIR%\dev
if not exist "%RC_DIR%\dev\qtkeychain" git clone https://github.com/frankosterfeld/qtkeychain.git
cd qtkeychain
echo Building qtkeychain...
if exist "%RC_DIR%\dev\qtkeychain\build" rm -rf %RC_DIR%\dev\qtkeychain\build
mkdir %RC_DIR%\dev\qtkeychain\build
cd /d %RC_DIR%\dev\qtkeychain\build
cmake -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=C:/OSGeo4W64/apps/Qt5 -DCMAKE_BUILD_TYPE=Release ..
nmake
nmake install

cd /d %RC_DIR%\dev
if not exist "%RC_DIR%\dev\QGIS" git clone git://github.com/qgis/QGIS.git
cp %RC_DIR%\packages\utils\package-nightly.cmd %RC_DIR%\dev\QGIS\ms-windows\osgeo4w\
cp %RC_DIR%\packages\utils\configonly.bat %RC_DIR%\dev\QGIS\ms-windows\osgeo4w\
echo Generating Visual Studio solution for build QGIS...
%RC_DIR%\dev\QGIS\ms-windows\osgeo4w\configonly.bat


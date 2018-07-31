@echo off

if not "%PROGRAMFILES(X86)%"=="" set PF86=%PROGRAMFILES(X86)%
if "%PF86%"=="" set PF86=%PROGRAMFILES%
if "%PF86%"=="" (echo PROGRAMFILES not set & goto error)

set VS140COMNTOOLS=%PF86%\Microsoft Visual Studio 14.0\Common7\Tools\
call "%PF86%\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64
path %path%;%PF86%\Microsoft Visual Studio 14.0\VC\bin

echo Setting up environment for Qt usage...
set PATH=c:\CMake\bin;C:\OSGeo4W64\apps\Qt5\bin;%PATH%
set LIB=%LIB%;C:\OSGeo4W64\apps\Qt5\lib
set INCLUDE=%INCLUDE%;C:\OSGeo4W64\apps\Qt5\include
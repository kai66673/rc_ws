@echo off
REM ***************************************************************************
REM    configonly.cmd
REM    ---------------------
REM    begin                : June 2018
REM    copyright            : (C) 2018 by Juergen E. Fischer
REM    email                : jef at norbit dot de
REM ***************************************************************************
REM *                                                                         *
REM *   This program is free software; you can redistribute it and/or modify  *
REM *   it under the terms of the GNU General Public License as published by  *
REM *   the Free Software Foundation; either version 2 of the License, or     *
REM *   (at your option) any later version.                                   *
REM *                                                                         *
REM ***************************************************************************

set ARCH=x86_64

set CONFIGONLY=1
set CMAKEGEN=Visual Studio 14 Win64

package-nightly.cmd 3.1.0 99 qgis-qt-5.10.1 %ARCH%

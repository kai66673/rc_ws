Важно: вся работа ведется в папке C:\rc_ws

0. Подготовка

Установить Visual Studio 2015 (если не установлена)
Установить CMake в папку C:\CMake

Загрузить cygwin-x86_64 из https://cygwin.com/setup-x86_64.exe
Запустить командную строку и выполнить
  setup-x86_64.exe -q -R c:\cygwin64 -P wget,flex,bison,unzip
  
1. Загрузка пакетов и установка OSGeo4W64 (01-prepare.cmd)

Загрузить следующие пакеты:
- osgeo4w: http://download.osgeo.org/osgeo4w/osgeo4w-setup-x86_64.exe
- Qt-5.10.1: http://download.qt.io/official_releases/qt/5.10/5.10.1/qt-opensource-windows-x86-5.10.1.exe
- PyQt-5.10.1: https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.10.1/PyQt5_gpl-5.10.1.zip
- Qscintilla-2.10.7: https://sourceforge.net/projects/pyqt/files/QScintilla2/QScintilla-2.10.7/QScintilla_gpl-2.10.7.zip
- sip-4.19.8: https://datapacket.dl.sourceforge.net/project/pyqt/sip/sip-4.19.8/sip-4.19.8.zip
- qwt-6.1.3: https://sourceforge.net/projects/qwt/files/qwt/6.1.3/qwt-6.1.3.zip
- CesiumJS-1.47: https://github.com/AnalyticalGraphicsInc/cesium/releases/download/1.47/Cesium-1.47.zip
- rasterio: https://www.lfd.uci.edu/~gohlke/pythonlibs

Устанавливаем OSGeoW:	
  osgeo4w-setup-x86_64.exe -k -A -R c:\OSGeo4W64 -P qgis-rel-dev,qgis-server
  (+sip 4.19.8.1, qgis 3.2.1-1, qgis-common 3.2.1-1, qgis-grass-plugin-common 3.2.1-1, qgis-grass-plugin7 3.2.1-1, qgis-server 3.2.1-1, libzip-devel, gsl-devel, python3-devel)

1.1. Заменяем Qt на версию Qt-5.10.1 в OSGeo4W64 (ручками)  
 Устанавлеваем Qt-5.10.1 (msvc 2015 x86_64) в папку по умолчанию
  c:\QGIS\packages\qt-opensource-windows-x86-5.10.1.exe
 Заменяем содержимое в C:\OSGeo4W64\apps\Qt5 содержимим c:\Qt\Qt5.10.1\5.10.1\msvc2015_64\
 Копируем папку c:\rc_ws\packages\PyQt5_gpl-5.10.1.zip\PyQt5_gpl-5.10.1\sip в c:\OSGeo4W64\apps\Python36 (предварительно удалив папку sip в ней)

2. PyQt5(5.10.1) и всего для radar_cad (02-work-deps.cmd)
  
  copy c:\OSGeo4W64\bin\python3.dll c:\OSGeo4W64\apps\Python36\
  copy c:\OSGeo4W64\bin\python36.dll c:\OSGeo4W64\apps\Python36\
  cd /d C:\OSGeo4W64\apps\Python36
  python -m pip install PyQt5==5.10.1
  
Клонируем пакеты из репозиториев в папку C:\rc_ws\Work
Устанавливаем зависимости через pip

3. Компилируем и устанавливаем QGIS и его зависимости (03-deps-qgis.cmd)

  Выполнить C:\rc_ws\03-deps-qgis.cmd
  Запускаем Visual Studio 2015 и открываем C:\rc_ws\dev\QGIS\ms-windows\osgeo4w\build-qgis-qt-5.10.1-x86_64\qgis.sln 
  Делаем полную сборку, до тех пор пока есть ошибки. Если в какой-то момент кол-во ошибок перестанет уменьшаться... горько плачем...
  В случае удачи, обязательно выполнить сборку проекта INSTALL
  
4. Пробуем - C:\rc_ws\Work\radar_cad\run_radar_cad.cmd 
  

  

  

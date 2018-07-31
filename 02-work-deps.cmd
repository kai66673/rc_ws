@echo off

cd /d %~dp0
set RC_DIR=%CD%

cd /d c:\OSGeo4W64\apps\Python36
python -m pip install PyQt5==5.10.1

cp c:\OSGeo4W64\bin\python3.dll c:\OSGeo4W64\apps\Python36\
cp c:\OSGeo4W64\bin\python36.dll c:\OSGeo4W64\apps\Python36\

if not exist "%RC_DIR%\Work" mkdir %RC_DIR%\Work
cd /D %RC_DIR%\Work
if not exist "%RC_DIR%\Work\radar_cad" git clone git@bitbucket.org:almaz_mipt/radar_cad.git
if not exist "%RC_DIR%\Work\qgis_research" git clone git@bitbucket.org:almaz_mipt/qgis_research.git
if not exist "%RC_DIR%\Work\bricks2" git clone git@bitbucket.org:almaz_mipt/bricks2.git
if not exist "%RC_DIR%\Work\bricks_cli" git clone git@bitbucket.org:almaz_mipt/bricks_cli.git
if not exist "%RC_DIR%\Work\diamond_geoproc" git clone git@bitbucket.org:almaz_mipt/diamond_geoproc.git
if not exist "%RC_DIR%\Work\diamond_indication" git clone git@bitbucket.org:almaz_mipt/diamond_indication.git
if not exist "%RC_DIR%\Work\flower" git clone git@bitbucket.org:almaz_mipt/flower.git
if not exist "%RC_DIR%\Work\flower_bricks" git clone git@bitbucket.org:almaz_mipt/flower_bricks.git
if not exist "%RC_DIR%\Work\flower_numpy" git clone git@bitbucket.org:almaz_mipt/flower_numpy.git
if not exist "%RC_DIR%\Work\flower_pyphased" git clone git@bitbucket.org:almaz_mipt/flower_pyphased.git
if not exist "%RC_DIR%\Work\flower_qt" git clone git@bitbucket.org:almaz_mipt/flower_qt.git
if not exist "%RC_DIR%\Work\misc_qt_utils" git clone git@bitbucket.org:almaz_mipt/misc_qt_utils.git
if not exist "%RC_DIR%\Work\pyphased" git clone git@bitbucket.org:almaz_mipt/pyphased.git
if not exist "%RC_DIR%\Work\pyphased_utils" git clone git@bitbucket.org:almaz_mipt/pyphased_utils.git
if not exist "%RC_DIR%\Work\radar_sim" git clone git@bitbucket.org:almaz_mipt/radar_sim.git --recurse-submodules

set path=c:\cygwin64\bin;%path%
unzip -qq %RC_DIR%\packages\Cesium-1.47.zip 'Build/CesiumUnminified/*' -d %RC_DIR%\packages
cp -r %RC_DIR%\packages\Build\CesiumUnminified\ %RC_DIR%\Work\radar_sim\cesium_research\
rm -rf %RC_DIR%\packages\Build

cd /D C:\OSGeo4W64\apps\Python36
python -m pip install numpy qtconsole
python -m pip install -r %RC_DIR%\Work\pyphased\requirements.txt
python -m pip install -r %RC_DIR%\Work\radar_sim\requirements.txt
python -m pip install %RC_DIR%\packages\rasterio-1.0.1-cp36-cp36m-win_amd64.whl
python -m pip install -r %RC_DIR%\Work\diamond_geoproc\requirements.txt
python -m pip install -r %RC_DIR%\Work\bricks_cli\requirements.txt
python -m pip install -r %RC_DIR%\Work\bricks2\requirements.txt

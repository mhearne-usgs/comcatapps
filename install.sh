#!/bin/bash

VENV=apps
PYVER=3.5

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    DEPARRAY=(numpy=1.11 \
              scipy=0.19.1 \
              matplotlib=1.5.3 \
              rasterio=1.0a2 \
              pandas=0.20.3 \
              shapely=1.5.17
              h5py=2.7.0 \
              gdal=2.1.4 \
              pytest=3.2.0 \
              pytest-cov=2.5.1 \
              ipython=6.1.0 \
              cartopy=0.15.1 \
              fiona=1.7.8 \
              pycrypto=2.6.1 \
              paramiko=2.2.1 \
              obspy=1.0.3 \
              xlrd=1.0.0 xlwt=1.2.0 \
              openpyxl=2.5.0a2 \
              xlsxwriter=0.9.8 \
              beautifulsoup4=4.5.3)
elif [[ "$unamestr" == 'FreeBSD' ]] || [[ "$unamestr" == 'Darwin' ]]; then
    DEPARRAY=(numpy=1.13.1 \
              scipy=0.19.1 \
              matplotlib=1.5.3 \
              rasterio=1.0a9 \
              pandas=0.20.3 \
              shapely=1.5.17 \
              h5py=2.7.0 \
              gdal=2.1.4 \
              pytest=3.2.0 \
              pytest-cov=2.5.1 \
              ipython=6.1.0 \
              jupyter=1.0.0 \
              cartopy=0.15.1 \
              fiona=1.7.8 \
              pycrypto=2.6.1 \
              paramiko=2.2.1 \
              obspy=1.0.3 \
              xlrd=1.0.0 xlwt=1.2.0 \
              openpyxl=2.5.0a2 \
              xlsxwriter=0.9.8 \
              beautifulsoup4=4.5.3)
fi

#if we're already in an environment called VENV, switch out of it so we can remove it
source activate root
    
#remove any previous virtual environments called libcomcat
CWD=`pwd`
cd $HOME;
conda remove --name $VENV --all -y
cd $CWD
    
#create a new virtual environment called $VENV with the below list of dependencies installed into it
conda create --name $VENV --yes --channel conda-forge python=$PYVER ${DEPARRAY[*]} -y

#activate the new environment
source activate $VENV

#impactutils
echo "Installing impactutils..."
curl --retry 3 -L https://github.com/usgs/earthquake-impact-utils/archive/master.zip -o impact.zip
pip install impact.zip
rm impact.zip

# MapIO
echo "Installing impactutils..."
curl --retry 3 -L https://github.com/usgs/MapIO/archive/master.zip -o mapio.zip
pip install mapio.zip
rm mapio.zip

# MapIO
echo "Installing libcomcat..."
curl --retry 3 -L https://github.com/usgs/libcomcat/archive/master.zip -o libcomcat.zip
pip install libcomcat.zip
rm libcomcat.zip

# This package
echo "Installing comcatapps..."
pip install -e .

#tell the user they have to activate this environment
echo "Type 'source activate ${VENV}' to use this new virtual environment."

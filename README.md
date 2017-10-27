# comcatapps
A variety of applications built using libcomcat and other NEIC tools.

Installation and dependencies
------------------------

We recommend using either the Anaconda (https://docs.anaconda.com/anaconda/) or
Miniconda (https://conda.io/miniconda.html) Python distributions.  These both use the
conda packaging tool, which makes installation of dependencies much simpler. To install
either of those packages, see the instructions on the web pages for each.

If you already have one of these two distributions installed, then you can try installing the
dependencies and this package by following the steps below, for Mac users:

 - `curl https://raw.githubusercontent.com/mhearne-usgs/comcatapps/master/mac_environment.yml -o environment.yml`
 - `conda env update -f=environment.yml`
 - `pip install git+git://github.com/usgs/earthquake-impact-utils.git`
 - `pip install git+git://github.com/usgs/libcomcat.git`
 - `pip install git+git://github.com/usgs/MapIO.git`
 - `pip install git+git://github.com/mhearne-usgs/comcatapps.git`

If this fails for any reason, you can try creating a new conda virtual environment by doing the following:

 - `git clone https://github.com/mhearne-usgs/comcatapps.git`
 - `cd comcatapps`
 - `bash install.sh`
 - `cd ..`
 - `pip install comcatapps`

If you use the second approach, you will need to run `source activate comcatapps` before using the programs
found in this repository.

The first program included in this package is called "shakestack.py", which allows a user to
search for ShakeMaps in a given study area, and "stack" them on a grid defined by the study area
boundaries and a resolution.  The output is stored in an HDF file, and can be retrieved and viewed as
documented in the "shakestack"
<a href="https://github.com/mhearne-usgs/comcatapps/blob/master/notebooks/shakestack.ipynb">notebook</a>
in this repository.




For help in using the tool, run:

`shakestack.py --help`


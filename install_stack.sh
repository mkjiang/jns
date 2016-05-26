#!/bin/bash
# script name:     install_stack.sh
# last modified:   2015/12/31
# sudo:            yes

if ! [ $(id -u) = 0 ]; then
   echo "to be run with sudo"
   exit 1
fi

pip install numpy
pip install matplotlib
pip install sympy
pip install pandas
pip install numexpr
pip install bottleneck
pip install SQLAlchemy
pip install openpyxl
pip install xlrd
pip install xlwt
pip install XlsxWriter
pip install beautifulsoup4
pip install html5lib

#------------------------------------------------------
apt-get -y install libxml2-dev libxslt-dev
#------------------------------------------------------

pip install lxml
pip install requests
pip install networkx
pip install plotly

#-----------------------------------------------------
apt-get -y install libblas-dev liblapack-dev
apt-get -y install libatlas-base-dev gfortran
#-----------------------------------------------------

pip install scipy
pip install pydotplus
pip install seaborn
pip install scikit-learn

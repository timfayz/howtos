#!/bin/bash

# sudo xbps-install -S wxWidgets-devel wxPython-devel python-devel glew-devel cairo-devel glm libcurl-devel boost-devel oce-devel swig
# ? libgomp-devel

#export CXXFLAGS="-std=c++11 $(wx-config --cxxflags)"
export CXXFLAGS="$(wx-config --cxxflags)"

cmake -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DKICAD_SPICE=ON \
      -DKICAD_SKIP_BOOST=ON \
      -DKICAD_SCRIPTING=ON \
      -DKICAD_SCRIPTING_MODULES=ON \
      -DKICAD_SCRIPTING_WXPYTHON=ON \
      -DPYTHON_SITE_PACKAGE_PATH=/usr/lib/python2.7/site-packages -DPYTHON_DEST=/usr/lib/python2.7/site-packages \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      ../../

#make -j8
#sudo make install

# git clone templates, footprints, packages3d, symbols
# mv * /usr/local/share/kicad
# sudo ln -s /usr/local/lib64/libkicad_3dsg.so.2.0.0 /usr/lib/

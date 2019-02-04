#!/bin/bash

# a long long wait later….

## test make
git clone https://github.com/Artistan/CMakeRPiExample.git &&
# go into build directory
cd CMakeRPiExample/build &&
# try it out...
cmake .. &&
make -j
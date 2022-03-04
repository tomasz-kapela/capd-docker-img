#!/bin/bash
DIR=`pwd`
sudo docker run -it --rm -v ${DIR}/workdir:/usr/src/workdir --name capd lagroht/capd

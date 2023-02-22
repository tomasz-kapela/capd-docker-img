#!/bin/bash

DIR=`pwd`'/workdir'
NAME='capd'
IMAGENAME='lagroht/capd'


HELP_MSG="USAGE :
    ./run.sh [-n name] [-t imageName] [-d path]
Options are:
  -n name       docker container name          (default=capd)
  -t imageName  name of docker image to be run (default=lagroht/capd)
  -d path       path to a folder that will be mounted in container at /usr/src/workdir"

while getopts n:t:d:h flag
do
    case "${flag}" in
        n) NAME=${OPTARG};;
        t) IMAGENAME=${OPTARG};;
				d) DIR=${OPTARG};;
        *) echo "$HELP_MSG"; exit 0;;
    esac
done
echo "IMAGE    : $IMAGENAME"
echo "CONTAINER: $NAME"
echo "WORKDIR  : $DIR"

sudo docker run -it --rm -v ${DIR}:/usr/src/workdir --name ${NAME} ${IMAGENAME}

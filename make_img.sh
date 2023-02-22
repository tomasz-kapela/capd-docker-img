#!/bin/bash
BUILDARGS=""
BUILDNAME="lagroht/capd"
HELP_MSG="USAGE :
    ./make_img.sh [-t imageTag] [-c gccVersion]
Options
    -t imageTag    docker image name e.g.  capd:v1.0       (default=${BUILDNAME})
    -c gccVersion  GCC image version used for docker build (default=latest)"

while getopts t:c:h flag
do
    case "${flag}" in
        t) BUILDNAME=${OPTARG};;
        c) BUILDARGS="${BUILDARGS} --build-arg GCCVERSION=${OPTARG}";;
        *) echo "$HELP_MSG"; exit 0;;
    esac
done

echo "Image name : ${BUILDNAME}";
echo "Args : ${BUILDARGS}";
docker build -t $BUILDNAME $BUILDARGS .

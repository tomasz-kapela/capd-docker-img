# capd-docker-img

Scripts to create and run docker image with current release of capd.

CAPD docker images are hosted on [https://hub.docker.com/r/lagroht/capd](https://hub.docker.com/r/lagroht/capd).

# Using capd docker image

The following command will run docker image `lagroht/capd` (Debian with latest gcc and capd installed).  

```bash
./run.sh
```
To access your source code, place it in the `workdir` subfolder (see [workdir/README.md](workdir/README.md) file for details). 

Options are:

*  `-n name`       docker container name          (default=capd)
*  `-t imageName`  name of docker image to be run (default=lagroht/capd)
*  `-d path`       path to a folder that will be mounted in container at /usr/src/workdir

## Versions of lagroht/capd

| Name | Details | 
|---- |---  |
|lagroht/capd:latest | lastest version |
|lagroht/capd:v12 | gcc 12.2 |
|lagroht/capd:v10 | gcc 10.4 |
|lagroht/capd:v8 | gcc 8.5 |


To run image given with `version` invoke

```bash
./run.sh -t lagroht/capd:v10 -n capd10
```
You can also call directly docker

```bash
sudo docker run -it --rm -v path/to/workdir:/usr/src/workdir --name containerName lagroht/capd:version
```

# Updating capd image 

The `run.sh` script will run given docker image (`lagroht/capd` by default). It will download image on the first use, 
but if it is present in local storage then it will use local one. 
Especially, it will not check for updates. To update/download `lagroht/capd` image you need to invoke 

```
docker pull lagroht/capd
```  

Other usefull commands

```
   docker images    # list local images
   docker image rm IMAGE_ID
```

# Creating capd docker image

To create local version of capd docker image run command

```bash
./make_img.sh
```

It will use latest gcc image and checkout and compile the latest capd version.

Options are:

* `-t imageTag`     sets docker image name e.g.  capd:v1.0       (default=lagroht/capd)
*  `-c gccVersion`  sets GCC image version used for docker build (default=latest)

```bash
# use *gcc:10.2* image as a base and tag image with  *myCAPD:v5.3*
./make_img.sh -t myCAPD:v5.3 -c 10.2
```

To choose other version of gcc or capd you can also edit `Dockerfile` file directly. 

# Uploading image do docker library

CAPD docker images are hosted on [https://hub.docker.com/r/lagroht/capd](https://hub.docker.com/r/lagroht/capd).

```bash
docker login
docker push lagroht/capd
```


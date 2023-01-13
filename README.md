# capd-docker-img

Scripts to create and run docker image with current release of capd.

# Using capd docker image

The following command will run docker image `lagroht/capd` (Debian with latest gcc and capd installed).  

```bash
./run.sh
```

To access your source code, place it in the `workdir` subfolder.

## Versions of lagroht/capd

| Name | Details | 
|---- |---  |
|lagroht/capd:latest | lastest version |
|lagroht/capd:v12 | gcc 12.2 |
|lagroht/capd:v10 | gcc 10.2 |
|lagroht/capd:v8 | gcc 8.4 |

To run image given `version` invoke

```bash
sudo docker run -it --rm -v path/to/workdir:/usr/src/workdir --name containerName lagroht/capd:version
```



# Creating capd docker image

To create local version of capd docker image run command

```bash
make_img.sh
```

It will use latest gcc image and checkout and compile the latest capd version.

To choose other version of gcc or capd you have to edit `Dockerfile` file. 


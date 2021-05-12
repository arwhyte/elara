# elara

A Docker image based on the jupyter-docker-stacks `scipy-notebook` image, which is itself based
on the `minimal-notebook` image, which is itself based on the `base-notebook` image. This repo and
project is named after Elara, a prograde irregular satellite of the planet Jupiter.

See [Jupyter Docker Stacks](https://github.com/jupyter/docker-stacks) for a description of each
image's dockerfile.

This image adds a number of additional packages including
[nbgrader](https://github.com/jupyter/nbgrader)
and [rise](https://github.com/damianavila/RISE).

## Generate image

Build the image. Note the trailing ".". Flags:

* -f &minus; path to file.
* -t &minus; tag name.

```cmd
docker build -f ./Dockerfile -t elara:latest .
```

## Run image in new container (JupyterLab)

Run the image, invoking the JupyterLab interface. Flags:

* --rm &minus; automatically clean up the container and remove the file system when the container exits.
Also removes anonymous volumes associated with the container.
* -p &minus; set the local port to 8888 and the container port to 8888 (required).
* -v &minus; bind local volume (name or abs path) to container volume (abs path).
* -e &minus; sets an environment variable (in this case, launching the JupyterLab interface).
* --name &minus; set local container name.

```commandline
docker run --rm -p 8888:8888 -v /Users/arwhyte/Development/repos/github/arwhyte/notebooks:/home/jovyan/work -e JUPYTER_ENABLE_LAB=yes --name lab elara
```

You can also start the container by running `run_lab.sh` passing in the port, volume, and local
name as arguments:

```commandline
sh run_lab.sh 8888 /Users/arwhyte/Development/repos/github/arwhyte/notebooks lab
```

## Run image in new container (Jupyter notebook classic)

Run the image, invoking the classic Jupyter notebook interface. Other flags:

* --rm &minus; automatically clean up the container and remove the file system when the container exits.
Also removes anonymous volumes associated with the container.
* -p &minus; set the local port to 8888 and the container port to 8888 (required).
* -v &minus; bind local volume (name or abs path) to container volume (abs path).
* --name &minus; set local container name.

```cmd
docker run --rm -p 8888:8888 -v /Users/arwhyte/Development/repos/github/arwhyte/notebooks:/home/jovyan/work --name notebook elara
```

You can also start the container by running `run_notebook.sh` passing in the port, volume, and
local name as arguments:

```commandline
sh run_notebook.sh 8888 /Users/arwhyte/Development/repos/github/arwhyte/notebooks notebook

```

## Remove containers

:warning: Docker containers are automatically removed when you stop them if you start the container
using the `--rm` flag (as above.

```commandline
$ docker container ls -a

CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
e65a3686df04        elara        "tini -g -- start-no…"   6 minutes ago       Up 6 minutes        0.0.0.0:8888->8888/tcp   jupyter_notebook

$ docker stop e65a3686df04
$ docker rm e65a3686df04
```

## Dockerfile

Image based on Jupyter Docker Stacks
[jupyter/scipy-notebook](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook) which, in turn, is based on the jupyter/minimal-notebook.

For package installs see:

* minimal-notebook [Dockerfile](https://github.com/jupyter/docker-stacks/blob/36bce751008f2c38cf9bd1cfc5f4ba46f6b426f1/minimal-notebook/Dockerfile)
* scipy-notebook [Dockerfile](https://github.com/jupyter/docker-stacks/blob/414b5d749704fc5abf15b5703551f0acb18e189a/scipy-notebook/Dockerfile)

### Additional package installs

* altair: visualization library (requires vega_datasets)
* folium: visualization library for geospatial data
* geopandas: extends the datatypes used by Pandas to allow spatial operations on geometric types
* nbgrader: Jupyter-based assignments and grading
* plotly: scientific graphing library
* rise: Jupyter-based slide views (gotchas: Not yet compatible with Jupyter Lab.
  See https://github.com/damianavila/RISE/issues/270)

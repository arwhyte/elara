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
docker run --rm -it -p 8888:8888 -v /path/to/notebooks:/home/jovyan/work --name lab elara
```

You can also start the container by running `run_lab.sh` passing in the port, volume, and local
name as arguments:

```commandline
sh run_lab.sh 8888 /path/to/notebooks lab
```

## Run image in new container (Jupyter notebook classic)

Run the image, invoking the classic Jupyter notebook interface. Other flags:

* --rm &minus; automatically clean up the container and remove the file system when the container exits.
Also removes anonymous volumes associated with the container.
* -p &minus; set the local port to 8888 and the container port to 8888 (required).
* -v &minus; bind local volume (name or abs path) to container volume (abs path).
* --name &minus; set local container name.

```cmd
docker run --rm -it -p 8888:8888 -e DOCKER_STACKS_JUPYTER_CMD=notebook -v /path/to/notebooks:/home/jovyan/work --name notebook elara
```

You can also start the container by running `run_notebook.sh` passing in the port, volume, and
local name as arguments:

```commandline
sh run_notebook.sh 8888 /path/to/notebooks notebook

```

## Docker compose

You can also start the elara Jupyter Lab container with [Docker Compose](https://docs.docker.com/compose/reference/). Place a copy of elara's `docker-compose.yml` in the root directory of your project. Then run

```commandline
docker compose up
```

Access the container at [http://127.0.0.1:8888/lab?token=elara](http://127.0.0.1:8888/lab?token=elara).

:exclamation: By default stopped service containers created by `docker compose up` or `docker compose run` are not removed. To eliminate these one-off containers run the following command:

```commandline
docker compose rm
```

## Dockerfile

Image based on Jupyter Docker Stacks
[jupyter/scipy-notebook](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook) which, in turn, is based on the jupyter/minimal-notebook.

For package installs see:

* minimal-notebook [Dockerfile](https://github.com/jupyter/docker-stacks/blob/36bce751008f2c38cf9bd1cfc5f4ba46f6b426f1/minimal-notebook/Dockerfile)
* scipy-notebook [Dockerfile](https://github.com/jupyter/docker-stacks/blob/414b5d749704fc5abf15b5703551f0acb18e189a/scipy-notebook/Dockerfile)

### Additional package installs

See [requirements.txt](requirements.txt).

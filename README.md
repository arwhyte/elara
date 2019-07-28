# jpyedu-scipy
Docker image based on the jupyter/scipy-notebook image. Adds [nbgrader](https://github.com/jupyter/nbgrader) 
and [rise](https://github.com/damianavila/RISE).

# Generate image
Build the image. Note the trailing ".". Flags:
* -f &minus; path to file.
* -t &minus; tag name.

```cmd
docker build -f ./Dockerfile -t jpyedu-scipy:latest .
```

# Run image in new container (JupyterLab)
Run the image, invoking the JupyterLab interface. Flags:
* --rm &minus; automatically clean up the container and remove the file system when the container exits. 
Also removes anonymous volumes associated with the container.
* -p &minus; set the local port to 8888 and the container port to 8888 (required).
* -v &minus; bind local volume (name or abs path) to container volume (abs path). 
* -e &minus; sets an environment variable (in this case, launching the JupyterLab interface).
* --name &minus; set local container name.

```cmd
docker run --rm -p 8888:8888 -v /Users/arwhyte/Development/jupyter:/home/jovyan/workspace -e JUPYTER_ENABLE_LAB=yes --name jupyter_lab jpyedu-scipy
```

# Run image in new container (Jupyter notebook classic)
Run the image, invoking the classic Jupyter notebook interface. Other flags:
* --rm &minus; automatically clean up the container and remove the file system when the container exits. 
Also removes anonymous volumes associated with the container.
* -p &minus; set the local port to 8888 and the container port to 8888 (required).
* -v &minus; bind local volume (name or abs path) to container volume (abs path). 
* --name &minus; set local container name.

```cmd
docker run --rm -p 8888:8888 -v /Users/arwhyte/Development/jupyter:/home/jovyan/workspace --name jupyter_notebook jpyedu-scipy
```
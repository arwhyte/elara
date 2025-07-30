ARG BASE_CONTAINER=quay.io/jupyter/scipy-notebook:latest
FROM ${BASE_CONTAINER}

LABEL maintainer="arwhyte@umich.edu"

# Copy requirements.txt into the image
COPY ./requirements.txt /tmp/requirements.txt

# Install Python dependencies
RUN python3 -m pip install --no-cache-dir -r /tmp/requirements.txt

# Enable nbgrader and its extensions
RUN jupyter nbextension install --sys-prefix --py nbgrader \
 && jupyter nbextension enable --sys-prefix --py nbgrader \
 && jupyter serverextension enable --sys-prefix --py nbgrader

# Optional: Enable labextension support for nbgrader
RUN jupyter labextension install @jupyterlab/server-proxy --no-build

# Set working directory
WORKDIR /home/jovyan

# (Optional) Pre-create course directory
RUN mkdir -p /home/jovyan/nbgrader

# Copy optional custom config (if you use it)
COPY config/jupyter_notebook_config.py /etc/jupyter/

# Ensure correct permissions
RUN chown -R jovyan:users /etc/jupyter /home/jovyan

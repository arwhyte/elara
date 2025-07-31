ARG BASE_CONTAINER=quay.io/jupyter/scipy-notebook:latest
FROM ${BASE_CONTAINER}

LABEL maintainer="arwhyte@umich.edu"

# Install additional 3rd-party packages
RUN python3 -m pip install --upgrade pip
COPY ./requirements.txt /tmp/
RUN python3 -m pip install --no-cache-dir -r /tmp/requirements.txt
# COPY . /tmp/

# WARN: nbgrader 0.8.1 depends on jupyter-server>=1.12
# Commented out nbgrader>=0.8.* from requirements.txt on 20230125
# Add nbgrader config file
# COPY ./nbgrader_config.py /home/jovyan/nbgrader_config.py

# Add nbgrader exchange directory
# RUN mkdir -p /tmp/nbgrader/exchange && chmod ugo+rw /tmp/nbgrader/exchange

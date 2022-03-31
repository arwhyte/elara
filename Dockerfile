FROM jupyter/scipy-notebook:latest

LABEL maintainer="arwhyte@umich.edu"

# WARN: comment out nbgrader until further notice
# https://github.com/jupyterlab/jupyterlab/issues/12094
# nbgrader triggering a ModuleNotFoundError
# No module named 'traitlets.utils.descriptions'
# Quick fix: remove nbgrader>=0.6.* from requirements.txt

# See https://github.com/jupyter-server/jupyter_server/issues/710

# Install additional 3rd-party packages
RUN python3 -m pip install --upgrade pip
COPY ./requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt
# COPY . /tmp/


# Add nbgrader config file
# COPY ./nbgrader_config.py /home/jovyan/nbgrader_config.py

# Add nbgrader exchange directory
# RUN mkdir -p /tmp/nbgrader/exchange && chmod ugo+rw /tmp/nbgrader/exchange
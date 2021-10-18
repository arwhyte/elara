FROM jupyter/scipy-notebook

LABEL maintainer="arwhyte@umich.edu"

# Install additional 3rd-party packages
RUN python3 -m pip install --upgrade pip
COPY ./requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt
# COPY . /tmp/

# Add nbgrader config file
COPY ./nbgrader_config.py /home/jovyan/nbgrader_config.py

# Add nbgrader exchange directory
RUN mkdir -p /tmp/nbgrader/exchange && chmod ugo+rw /tmp/nbgrader/exchange
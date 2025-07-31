FROM python:3.12.3-slim-bullseye

LABEL maintainer="arwhyte@umich.edu"

# Upgrade system packages and install necessary dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    nodejs \
    npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create non-root user with fixed UID/GID (1000:100) to match docker-compose
RUN useradd -m -u 1000 -o -s /bin/bash jovyan || true

# Set HOME explicitly
ENV HOME=/home/jovyan

# Set working directory for notebooks and ensure ownership
RUN mkdir -p ${HOME}/work \
 && chown -R 1000:100 ${HOME}

WORKDIR ${HOME}/work

# Copy requirements.txt into the image
COPY ./requirements.txt /tmp/requirements.txt

# Install Python dependencies
RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r /tmp/requirements.txt

# Enable nbgrader server extension (Jupyter Server 2.x+)
RUN jupyter server extension enable --sys-prefix nbgrader.server_extensions.formgrader

# Copy custom nbgrader config into Jupyter's config directory
COPY config/jupyter_notebook_config.py /etc/jupyter/
RUN chown 1000:100 /etc/jupyter/jupyter_notebook_config.py

# Expose default Jupyter port
EXPOSE 8888
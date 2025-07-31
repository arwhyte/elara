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

# Copy requirements.txt into the image
COPY ./requirements.txt /tmp/requirements.txt

# Install Python dependencies
RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r /tmp/requirements.txt

# Enable nbgrader server extension (Jupyter Server 2.x+)
RUN jupyter server extension enable --sys-prefix nbgrader.server_extensions.formgrader

# Create default notebook directory and ensure correct permissions
RUN mkdir -p /home/jovyan/work && chown -R 1000:100 /home/jovyan

# Set default working directory (launches Jupyter here)
WORKDIR /home/jovyan/work

# Expose default Jupyter port
EXPOSE 8888

# Run JupyterLab in insecure dev mode (customize for prod!)
# CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=", "--NotebookApp.password="]
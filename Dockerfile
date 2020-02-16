FROM jupyter/scipy-notebook

LABEL maintainer="arwhyte@umich.edu"

RUN conda update -n base conda

RUN conda install --quiet --yes \
    altair \
    vega_datasets \
    nbgrader \
    rise

# Add nbgrade config file
COPY nbgrader_config.py /home/jovyan/nbgrader_config.py

# Add nbgrader exchange directory
RUN mkdir -p /tmp/nbgrader/exchange && chmod ugo+rw /tmp/nbgrader/exchange
# RUN mkdir -p /srv/nbgrader/exchange && chmod ugo+rw /srv/nbgrader/exchange

# WORKDIR /run
# COPY run_notebook.sh /usr/local/bin/run_notebook.sh

# USER root
# RUN chmod +x /usr/local/bin/run_notebook.sh
# RUN ["chmod", "+x", "/usr/local/bin/run_notebook.sh"]

# USER $NB_USER
# CMD ["/usr/local/bin/run_notebook.sh"]
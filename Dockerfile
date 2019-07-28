# Image based on jupyter/scipy-notebook which, in turn, is based on the jupyter/minimal-notebook.
# The jupyter/scipy-notebook adds pandas, numexpr, matplotlib, scipy, seaborn, scikit-learn, scikit-image,
# sympy, cython, patsy, statsmodel, cloudpickle, dill, numba, bokeh, sqlalchemy, hdf5, vincent, beautifulsoup,
# protobuf, xlrd, and ipywidgets and Facets.
# See https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook
FROM jupyter/scipy-notebook:64c893e91c60

LABEL maintainer="arwhyte@umich.edu"

# fuzzywuzzy: string matching that calculates the difference between string sequences.
# github: https://github.com/seatgeek/fuzzywuzzy
# docs: https://chairnerd.seatgeek.com/fuzzywuzzy-fuzzy-string-matching-in-python/
# source: conda-forge
# dependencies:
# gotchas:
RUN conda install fuzzywuzzy --yes

# nbgrader: assignments and grading
# github: https://github.com/jupyter/nbgrader
# docs: https://nbgrader.readthedocs.io/en/stable/
# source: conda-forge
# dependencies: setting --no-deps flag resulted in "environment is inconsistent" warning.
# gotchas: latest nbgrader release is pinging an old ipython version which prevents installs alongside newer packages.
# See https://github.com/jupyter/nbgrader/issues/1159
# Note: When fixed the previous installation of "fuzzywuzzy" can be removed along with the --no-deps flag.
RUN conda install nbgrader --yes
# RUN conda install nbgrader --no-deps --yes

# rise: notebook slides
# github: https://github.com/damianavila/RISE
# docs: https://rise.readthedocs.io
# source: conda-forge
# dependencies: required dependencies already present
# gotchas: Not yet compatible with Jupyter Lab. Expected 1.1 integration (Sept 2019).
# See https://github.com/damianavila/RISE/issues/270
RUN conda install rise --no-deps --yes
FROM rocker/rstudio:4.4.1

LABEL source="https://github.com/davetang/learning_docker/blob/main/rstudio/Dockerfile"

# MAINTAINER Dave Tang <me@davetang.org>

RUN apt-get clean all && \
    apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y \
    cmake \
    libgdal-dev \
    gdal-bin \
    libgeos-dev \
    libproj-dev \
    libsqlite3-dev \
    libhdf5-dev \
    libssl-dev \
    libxml2-dev \
    libpng-dev \
    libxt-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libglpk40 \
    libgit2-dev \
    libudunits2-dev \
    xml2 \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    libglpk-dev \
    libnode-dev \
    unixodbc-dev \
    libfontconfig1-dev \
    libmagick++-dev \
    && apt-get clean all && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# the rstudio/ path is set for building with GitHub Actions
COPY --chown=rstudio:rstudio rstudio-prefs.json /home/rstudio/.config/rstudio
COPY --chown=rstudio:rstudio .Rprofile /home/rstudio/

RUN Rscript -e "install.packages(c('pak'));"
RUN Rscript -e "pak::pkg_install(c( \
    'devtools', 'formatR', 'ggrepel', 'ggridges', 'here', 'lintr', \
    'markdown', 'pheatmap', 'Rcpp', \
    'Seurat', 'tidyverse', 'uwot', 'biomaRt', 'bluster', \
    'celldex', 'clusterProfiler', 'DESeq2', 'ensembldb', 'org.Mm.eg.db', \
    'org.Hs.eg.db', 'scater', 'scRNAseq', 'scran', 'SingleR' \
    ))"

# https://cole-trapnell-lab.github.io/monocle3/docs/installation/
RUN Rscript -e "pak::pkg_install(c('BiocGenerics', 'DelayedArray', 'DelayedMatrixStats', \
    'limma', 'lme4', 'S4Vectors', 'SingleCellExperiment', \
    'SummarizedExperiment', 'batchelor', 'HDF5Array', \
    'terra', 'ggrastr', 'pachterlab/sleuth'))"
RUN Rscript -e "pak::pkg_install('cole-trapnell-lab/monocle3')"
RUN rm -rf /tmp/* && rm -rf /var/lib/apt/lists/*

COPY --chown=rstudio:rstudio adduser.sh /home/rstudio/
RUN chmod +x /home/rstudio/adduser.sh

RUN sudo adduser rstudio sudo

WORKDIR /home/rstudio

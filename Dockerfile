FROM continuumio/anaconda3:5.3.0
#MAINTAINER Tiago Antao <tiagoantao@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

#RUN apt update && apt upgrade -y
RUN apt install -y git wget build-essential unzip
#RUN apt-get install -y samtools mafft muscle raxml tabix

# R
#RUN apt-get install -y r-bioc-biobase

RUN apt install -y graphviz libgraphviz-dev pkg-config swig libx11-dev
# phylo/biopython 
# simupop
#RUN apt-get install -y libx11-dev
#RUN apt-get install -y libgsl0ldbl
RUN apt-get install -y libgsl0-dev libopenblas-dev liblapacke-dev
#RUN apt-get clean


RUN conda config --add channels bioconda 
RUN conda config --add channels r
RUN conda config --add channels conda-forge
RUN conda install --yes biopython statsmodels pysam plink gffutils genepop trimal simuPOP pip rpy2 r-ggplot2 r-gridextra
RUN conda install --yes pygraphviz eigensoft seaborn pexpect pyvcf dendropy networkx reportlab tzlocal

RUN pip install pygenomics

EXPOSE 9875

RUN git clone https://github.com/PacktPublishing/Bioinformatics-with-Python-Cookbook-Second-Edition.git
WORKDIR /Bioinformatics-with-Python-Cookbook-Second-Edition

RUN echo setterm -foreground magenta >> /etc/bash.bashrc
CMD jupyter-notebook --ip=0.0.0.0 --no-browser --allow-root --port=9875

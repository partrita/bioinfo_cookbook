FROM continuumio/anaconda3:5.2.0
#MAINTAINER Tiago Antao <tiagoantao@gmail.com>
#ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y git wget build-essential unzip graphviz libgraphviz-dev pkg-config swig libx11-dev libgsl0-dev libopenblas-dev liblapacke-dev
#RUN apt-get install -y samtools mafft muscle raxml tabix

# R
#RUN apt-get install -y r-bioc-biobase

#RUN apt-get install -y graphviz libgraphviz-dev pkg-config swig libx11-dev
#phylo/biopython 
#simupop
#RUN apt-get install -y libx11-dev
#RUN apt-get install -y libgsl0ldbl
#RUN apt-get install -y libgsl0-dev libopenblas-dev liblapacke-dev
#RUN apt-get clean

RUN conda update -y -n base -c defaults conda | conda config --add channels bioconda | conda config --add channels r | conda config --add channels conda-forge
RUN conda install --yes biopython statsmodels pysam plink gffutils genepop trimal simuPOP pip rpy2 r-ggplot2 r-gridextra pygraphviz eigensoft seaborn pexpect pyvcf dendropy networkx reportlab tzlocal
RUN pip install pygenomics

EXPOSE 9875

RUN git clone https://github.com/PacktPublishing/Bioinformatics-with-Python-Cookbook-Second-Edition.git
WORKDIR /Bioinformatics-with-Python-Cookbook-Second-Edition

RUN echo setterm -foreground magenta >> /etc/bash.bashrc
CMD jupyter-notebook --ip=0.0.0.0 --no-browser --allow-root --port=9875

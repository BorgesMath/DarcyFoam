# Use uma imagem base do Ubuntu
FROM ubuntu:20.04

# Instale dependências necessárias
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Baixe e instale o OpenFOAM
RUN wget -q -O - http://dl.openfoam.org/gpg.key | apt-key add - \
    && add-apt-repository http://dl.openfoam.org/ubuntu \
    && apt-get update \
    && apt-get install -y openfoam8 \
    && rm -rf /var/lib/apt/lists/*

# Configure o ambiente do OpenFOAM
RUN echo "source /opt/openfoam8/etc/bashrc" >> ~/.bashrc

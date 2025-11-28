FROM ghcr.io/quarto-dev/quarto:latest

ENV DEBIAN_FRONTEND=noninteractive

# --- System dependencies ---
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        git \
        python3 python3-pip python3-venv \
        texlive-full \
        libfontconfig \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir jupyter ipykernel matplotlib plotly scikit-learn
RUN python3 -m ipykernel install --name=python3 --display-name "Python 3"

# --- Install recent Node.js (NodeSource) ---
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get update && \
    apt-get install -y --no-install-recommends nodejs && \
    rm -rf /var/lib/apt/lists/*

# log versions at build time (handy for debugging)
RUN node -v && npm -v

RUN npm install -g decktape

WORKDIR /project

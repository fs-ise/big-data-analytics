FROM ghcr.io/quarto-dev/quarto:latest

# --- System dependencies (adapt this block to match what you already had) ---
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        git \
        python3 python3-pip python3-venv \
        texlive-full \
        libfontconfig \
    && rm -rf /var/lib/apt/lists/*

# --- Install recent Node.js (NodeSource) ---
# IMPORTANT: if you previously had "apt-get install nodejs npm" somewhere,
# remove that – we replace it with this modern Node.js.
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get update && \
    apt-get install -y --no-install-recommends nodejs && \
    rm -rf /var/lib/apt/lists/*

# Optional: check versions during build (handy for debugging)
RUN node -

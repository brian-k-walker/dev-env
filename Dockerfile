# Stage 1: Grab Python 3.13 from the official image
FROM python:3.13-slim-bookworm AS python_base

# Stage 2: Final image
FROM node:24-slim

# Copy Python 3.13 binaries and libraries from the first stage
COPY --from=python_base /usr/local/ /usr/local/

# Install system dependencies (excluding python3.13 since we just copied it)
RUN apt-get update && apt-get install -y \
    curl \
    git \
    vim \
    # Playwright dependencies
    wget \ 
    gnupg \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @google/gemini-cli

# Playwright dependencies
RUN pip install playwright
RUN playwright install --with-deps chromium

RUN pip install jupyter pandas

WORKDIR /app

# Verify installations
RUN node -v && npm -v && python3 --version gemini --help

CMD ["/bin/bash"]
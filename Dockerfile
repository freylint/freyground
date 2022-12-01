# Setup base DinD image
FROM rust:1.65-slim-buster as development
SHELL ["/bin/bash", "--login", "-c"]
# Install dependencies
RUN apt-get update && apt-get install -y \
    git bash curl build-essential pkg-config && \
    apt-get clean
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash 
RUN nvm install 19
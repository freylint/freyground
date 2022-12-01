# Setup base DinD image
FROM rust:1.65-slim-buster as development
# Install dependencies
RUN apt update && apt install -y \
    git bash curl build-essential npm pkg-config && \
    apt clean
RUN npm install -fg \
    @bazel/bazelisk @bazel/buildifier && \
    cargo install 

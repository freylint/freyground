# Setup base DinD image
FROM rust:1.65-slim-buster as development
SHELL ["/bin/bash", "--login", "-c"]
# Install dependencies
RUN apt-get update && apt-get install -y \
    git bash curl build-essential pkg-config && \
    apt-get clean
# Setup rooless user
ARG USERNAME=rootless
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupmod --gid $USER_GID $USERNAME \
    && usermod --uid $USER_UID --gid $USER_GID $USERNAME \
    && chown -R $USER_UID:$USER_GID /home/$USERNAME
USER $USERNAME
# Install NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash 
RUN nvm install 19

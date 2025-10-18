# filepath: .devcontainer/Containerfile
FROM debian:bookworm

# Set up environment for rootless Podman
ENV XDG_RUNTIME_DIR="/run/user/1000"
ENV DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
ENV PACKAGES=""

# Install dependencies for Bazel, git, and other common dev tools
RUN apt-get update && apt-get install -y ansible make

RUN make devenv

RUN apt-get autoremove -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set locale to en_US.UTF-8 to avoid Ansible locale errors
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen &&\
    locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Set default shell for dev user to zsh
RUN chsh -s /bin/zsh dev

# Setup rootless Podman
RUN mkdir -p /run/user/1000/podman && \
    chown -R dev:dev /run/user/1000
RUN podman system service --time=0 unix:///run/user/1000/podman/podman.sock &
RUN containerd &

ENV PATH="$PATH:/dev/go/bin"
ENV DOCKER_HOST="unix:///run/user/1000/podman/podman.sock"

# Install azure developers cli
#RUN curl -fsSL https://aka.ms/install-azd.sh | bash

# Set dev user's ZSH prompt with Catppuccin-inspired colors
RUN echo 'autoload -U colors\ncolors\nexport PS1="%F{110}%~%f %F{217}%#%f "' >> /home/dev/.zshrc
RUN echo 'alias make="cd /workspaces/fground && make"' >> /home/dev/.zshrc

USER dev

#RUN go install golang.org/x/tools/gopls@latest
#RUN go install golang.org/x/tools/cmd/goimports@latest

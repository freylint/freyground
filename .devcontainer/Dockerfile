# Setup base DinD image
FROM docker:20.10-dind
RUN apk add --no-cache \
    git bash curl rustup \
    npm npm-bash-completion nodejs-current
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    bazel5
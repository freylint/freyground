# Setup base DinD image
FROM docker:20.10-dind as development
# Install dependencies
RUN apk add \
    git bash curl gcc g++ \
    rust cargo
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    bazel5
# Cache project build
WORKDIR /usr/src/freyground/
COPY . .
RUN cd /usr/src/freyground && ls -la && bazel build //...
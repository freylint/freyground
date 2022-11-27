# Dockerfile for the Freyground.
# Specificies the various, build, dev, and prod environments.

# Base / Common dependencies across all images except the runner
FROM rustlang/rust:nightly-alpine3.15 as base
WORKDIR /usr/src/freyground/
RUN apk add --no-cache \
    nodejs=16.17.1-r0 \
    npm \
    make \
    build-base

# The development image for containerized development
FROM base as development
WORKDIR /usr/src/freyground/
RUN apk add --no-cache \
    git

# Builder for automated building of the application
FROM base as builder
WORKDIR /usr/src/freyground/
COPY . .
RUN make rbuild

# Final Application runner
FROM alpine:3.15 as runner
WORKDIR /var/www/
EXPOSE 80:8000
COPY --from=builder /usr/src/freyground/dist/ /var/www/

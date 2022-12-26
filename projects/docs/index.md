# Freyground

This is my personal Monorepo, The Freyground.

It uses the following buzzwords:

- Containerized Development
- Microservices
- Behavior Driven Development
- Test Driven Development
- Parallel Concurrent Actor Architecture
- Blackboard Messaging
- 🚀Blazingly Fast🚀 WASM/Rust messaging and supervision

These decisions were made as a result of proto1 (visible at the proto1 tag) going into code rot
after only a few weeks into development.

## Building
> git submodule init

> git submodule update

> make

## TODO v0.0.1

[] - Make build system work w/ npm workspaces
[] - Port build system to gulp.
[] - Combine output of jest and rust tests
[] - Make fg-model nostd + wee-alloc

!!!include(philosophy.md)!!!

!!!include(architecture.md)!!!

!!!include(historical.md)!!!

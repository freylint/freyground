# Freyground Project Repository

Dead simple mono repository for the freyground homelab project.
Automations are provided through `GNU Make`.
See project for detials.

## Project Links:
- [Infrastructure Automation](projects/infra/)
- [Website](projects/website/)

---
_Individual project READMEs:_
[](#infra)
## Freyground Infrastructure Automation (infra)

This repository contains the infrastructure automation scripts for the Freyground project.
It is designed to make a reproducible homelab environment with extremely little
maintenance or complexity required.

### Building the Homelab
The freyground homelab automation is built for [Centos Stream 9](https://www.centos.org/).

#### Prerequisites
- A working installation of CentOS Stream 9
- The `git` package installed on your system (e.g., via `sudo dnf install git`)
- The `make` package installed on your system (e.g., via `sudo dnf install make`)

#### Deploying
Once all dependencies are met, you can deploy the homelab by running the following command:
> sudo make homelab
# Freyground Web Project

Web portal to the projects present in this repository.
This is a web server implemented as a [Podman Quadlet](https://www.redhat.com/en/blog/quadlet-podman)
installed through [GNU Make](https://www.gnu.org/software/make/manual/make.html).

## Getting Started

To serve this project locally simply run:
> make local

To install it to a server running a modern release of podman, use the following command:
> sudo make install

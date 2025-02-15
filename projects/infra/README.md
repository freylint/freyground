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

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
[](#website)
# Freyground **Webpage**

The Freyground webpage is a (mostly) static site intended to
serve as a Blog, Service Dashboard, and Contact Page for myself
and my public projects

## Architecture
This site is implemented with Bun + React SSR + MithrilJS Stack.
Rendering is done in three phases:
- [Stage One](file://src/stage1.js): A React server side render of each individual page into a React component.
- [Stage Two](file://src/stage2.js): A React server side render combining all pages into a single document. Hiding inactive pages
- ~Stage Three (UNIMPLEMENTED): A MithrilJS client side render to update the DOM with non-static data.

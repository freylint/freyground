# Freyground Mono Repository

This is an ansible based polyglot repository that implements a hybrid azure cloud
linked through strongswan.

## Requirements

- [Azure Login](https://azure.microsoft.com/en-us)
- [StrongsSwan PSK](https://www.tecmint.com/generate-pre-shared-key-in-linux/)
- A local machine configured to run debian bookworm
- A USB stick
- More time than sense

## Quickstart

1. Update group_vars/all/vault.yml with your strongswan PSK and Azure login
2. Enter cicd.Containerfile environment through devcontainers or your OCI runtime
3. Run `make CI` to build and test all components
4. Run `make CD` to deploy all cloud components
5. Update the [homelab](./roles/homelab/files) image to work with your local storage
6. Update the [homelab](./roles/homelab/files) and [gateway](./roles/homelab/files) to perform nesecarry config changes to enable strongswan to punch through NAT / use static IPs / etc
7. `dd` the generated live iso in /tmp/ to a USB stick
8. Configure local server to boot from USB stick first
9. Plug in USB and reboot local server

NOTE: I offer no further support for anyone trying replicating this set-up

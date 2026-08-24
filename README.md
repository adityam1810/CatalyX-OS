# CatalyX OS [CODENAME - MODI]

> A modular Debian-based Linux distribution focused on Cloud, Security, DevOps, and system administration.

🚧 **Status: Active Development — v0.1**

## Overview

CatalyX is a lightweight, modular Linux distribution built on Debian.

The project explores how a Linux environment can provide a unified command-line interface for system administration, cloud tooling, security diagnostics, and DevOps workflows.

## Current Features

- Modular CLI architecture
- Configuration-driven OS identity
- System diagnostics
- Network diagnostics
- Cloud environment and tooling detection
- Security diagnostics
- DevOps tooling detection
- Package management
- Service management
- User management
- Storage diagnostics

## CLI

CatalyX provides simple commands for common administration tasks:

```bash
about
system
network
cloud
security
devops


## Example

system cpu
system memory
system disk

cloud aws
cloud docker
cloud kubernetes
cloud network

security firewall
security ports
security ssh
security audit

devops git
devops docker
devops kubernetes
devops terraform
devops ci

## Architecture

                    CatalyX OS
                         |
                  /usr/local/bin
                         |
                       distro
                         |
              +----------+----------+
              |          |          |
            System     Cloud     Security
              |          |          |
              +----------+----------+
                         |
                       DevOps
                         |
                 Modular Modules
                         |
              /usr/local/lib/distro


The CLI uses a centralized dispatcher with independent modules.

This makes the system easier to extend and allows individual subsystems to evolve independently.

-Technology
-Debian GNU/Linux
-Bash
-Linux
-systemd
-Git
-Docker integration
-AWS CLI integration
-Kubernetes tooling integration
-Terraform integration

##Roadmap
v0.1
- CLI foundation
 -System module
 Cloud module
 Security module
 DevOps module
 Network module
 Package module
 Service module
 User module
 Storage module
 Configuration/branding engine
 Build system
 Bootable ISO
 Fresh VM installation testing

##Future

Cloud-native workflows
Security hardening tools
Container-first workflows
Automated system diagnostics
Reproducible builds
CatalyX ISO releases

##Project Structure

CatalyX-OS/
├── README.md
├── LICENSE
├── .gitignore
├── modules/
│   ├── cloud
│   ├── devops
│   ├── network
│   ├── packages
│   ├── security
│   ├── services
│   ├── storage
│   ├── system
│   └── users
└── scripts/
    └── distroDevelopment

##Development

CatalyX is currently being developed and tested inside VirtualBox.

The project is developed incrementally, with each subsystem implemented as an independent module.

##Author

Developed as a personal Linux, Cloud, Security, and DevOps engineering project.

##License

See LICENSE

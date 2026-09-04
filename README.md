# ⚡ CatalyX OS

<img width="1536" height="1024" alt="ChatGPT Image Aug 26, 2026, 11_50_43 PM" src="https://github.com/user-attachments/assets/b38a7b68-8453-46d5-9dab-33796ce405e0" />

# 🚀 CatalyX OS

### A Debian-based Modular Linux Distribution

**Codename:** MODI  
**Version:** 0.1  
**Base:** Debian Trixie 13.6  
**Architecture:** amd64  
**Type:** CLI-focused Linux distribution

---

## 🚀 About

**CatalyX OS** is a Debian-based Linux distribution designed around a modular, CLI-first environment for system administration, networking, security, cloud, and DevOps workflows.

CatalyX combines the stability and package ecosystem of Debian with a custom command architecture designed for system management and technical workflows.

> **Built on Debian. Extended by CatalyX.**

---

## 🧩 Architecture

CatalyX uses a central CLI dispatcher with independent system modules.

```text
                              ┌─────────────────────┐
                              │     CatalyX OS      │
                              │     Codename MODI   │
                              └──────────┬──────────┘
                                         │
                                         ▼
                              ┌─────────────────────┐
                              │    CatalyX CLI      │
                              │     Dispatcher      │
                              └──────────┬──────────┘
                                         │
              ┌──────────────────────────┼──────────────────────────┐
              │                          │                          │
              ▼                          ▼                          ▼
       ┌─────────────┐           ┌─────────────┐           ┌─────────────┐
       │   System    │           │    MoDI     │           │   Network   │
       └─────────────┘           └──────┬──────┘           └─────────────┘
                                        │
                                  ┌─────┴─────┐
                                  │           │
                                  ▼           ▼
                               ┌──────┐    ┌──────┐
                               │ APT  │    │ DPKG │
                               └──────┘    └──────┘

              ┌──────────────────────────┼──────────────────────────┐
              │                          │                          │
              ▼                          ▼                          ▼
       ┌─────────────┐           ┌─────────────┐           ┌─────────────┐
       │  Security   │           │    Cloud    │           │   DevOps    │
       └─────────────┘           └─────────────┘           └─────────────┘
              │                          │                          │
              └──────────────────────────┼──────────────────────────┘
                                         │
                           ┌─────────────┴─────────────┐
                           │                           │
                           ▼                           ▼
                    ┌─────────────┐             ┌─────────────┐
                    │  Services   │             │   Storage   │
                    └──────┬──────┘             └──────┬──────┘
                           │                           │
                           └─────────────┬─────────────┘
                                         │
                                         ▼
                                  ┌─────────────┐
                                  │    Users    │
                                  └─────────────┘
```

---

## 🧩 MoDI

### Modular Distribution Interface

**MoDI (Modular Distribution Interface)** is the package-management interface of CatalyX OS.

MoDI provides a CatalyX-oriented interface over Debian's existing package infrastructure while retaining compatibility with Debian's package ecosystem.

```text
                       MoDI
                        │
              ┌─────────┴─────────┐
              ▼                   ▼
             APT                 DPKG
```

### Current MoDI Capabilities

```text
packages
packages info
packages installed
packages search <name>
packages show <package>
packages updates
```

MoDI is designed to evolve into a broader package and distribution management interface for CatalyX.

---

## 🛠️ CatalyX Modules

CatalyX currently contains **9 modular components**.

| Module | Description |
|---|---|
| `system` | System information and diagnostics |
| `network` | Interfaces, routes, DNS, and connectivity |
| `packages` | Package discovery and update information |
| `security` | Security and system checks |
| `services` | systemd service inspection and diagnostics |
| `storage` | Disks, filesystems, mounts, and memory |
| `users` | Users, groups, sudo, and login information |
| `cloud` | Cloud and cloud-native tooling |
| `devops` | Development and DevOps tooling |

---

## 💻 CatalyX CLI

CatalyX provides a unified command-line interface.

```bash
catalyx version
catalyx about
catalyx system
catalyx network
catalyx cloud
catalyx security
catalyx devops
catalyx services
catalyx storage
catalyx users
```

The architecture allows additional modules to be added without redesigning the core dispatcher.

---

## ☁️ Cloud & DevOps

CatalyX includes dedicated modules for cloud and DevOps workflows.

The DevOps tooling layer is designed around technologies such as:

- Git
- Docker
- Kubernetes
- Terraform
- Python

The Cloud module provides detection and management-oriented information for cloud-native tooling and environments.

---

## 🔐 Security

CatalyX includes a dedicated security module for system-level inspection.

Current functionality includes areas such as:

- Firewall status
- Listening network ports
- Current user
- Authentication / login information

---

## 🌐 Networking

The network module provides:

- Network interfaces
- Routing table
- DNS configuration
- Internet connectivity
- DNS connectivity

### Example

```bash
catalyx network
```

---

## 💾 Storage

The storage module provides information about:

- Block devices
- Filesystem usage
- Mounted filesystems
- Memory
- Swap

### Example

```bash
catalyx storage
```

---

## ⚙️ Services

CatalyX integrates with **systemd** for service inspection.

### Examples

```bash
catalyx services
catalyx services running
catalyx services failed
catalyx services enabled
catalyx services status ssh
```

---

## 👥 Users

The users module provides:

```bash
catalyx users
catalyx users list
catalyx users groups
catalyx users sudo
catalyx users who
```

The implementation intentionally avoids conflicting with Debian's existing `/usr/bin/users` command.

---

## 🐧 Base System

CatalyX OS v0.1 is built on:

| Component | Version / Technology |
|---|---|
| **Base** | Debian Trixie |
| **Debian version** | 13.6 |
| **Architecture** | amd64 |
| **Kernel** | Linux 6.12.x |
| **Init system** | systemd |
| **Package system** | APT / DPKG |
| **Bootloader** | GRUB |
| **Live environment** | live-boot |

---

## 🔨 Reproducible ISO Build

CatalyX includes a build pipeline for generating the bootable ISO from a clean Debian root filesystem.

```text
CatalyX Source
      │
      ▼
  debootstrap
      │
      ▼
Debian Trixie RootFS
      │
      ▼
CatalyX Configuration
      │
      ▼
CatalyX Modules
      │
      ▼
Linux Kernel + Live Boot
      │
      ▼
   SquashFS
      │
      ▼
     GRUB
      │
      ▼
   xorriso
      │
      ▼
CatalyX OS ISO
```

### Build Requirements

```text
debootstrap
xorriso
grub-mkrescue
mksquashfs
```

### Build

```bash
git clone https://github.com/adityam1810/CatalyX-OS.git
cd CatalyX-OS
sudo ./build.sh
```

The generated ISO will be located at:

```text
build/output/CatalyX-OS-0.1-MODI.iso
```

---

## 💿 CatalyX OS v0.1

### First Bootable Release

**CatalyX OS v0.1 — Codename: MODI**

The first release is distributed as a bootable Live ISO.

The ISO was built from a fresh Debian Trixie root filesystem and successfully tested in an independent VirtualBox virtual machine.

### Release Artifact

```text
CatalyX-OS-0.1-MODI.iso
```

The official ISO is available through the project's GitHub Releases.

---

## 🧪 Validation

CatalyX v0.1 was tested outside the original development environment using a fresh VirtualBox VM.

| Test | Status |
|---|:---:|
| Bootable ISO | ✅ |
| Fresh VM boot | ✅ |
| CatalyX login | ✅ |
| CatalyX CLI | ✅ |
| CatalyX branding | ✅ |
| System module | ✅ |
| Network module | ✅ |
| Packages / MoDI | ✅ |
| Security module | ✅ |
| Services module | ✅ |
| Storage module | ✅ |
| Users module | ✅ |
| Cloud module | ✅ |
| DevOps module | ✅ |

This validates that the generated ISO can operate independently of the development VM.

---

## 📁 Repository Structure

```text
CatalyX-OS/
│
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
│
├── scripts/
│   └── distro
│
├── config/
│   ├── catalyx.conf
│   └── packages
│
├── build.sh
├── .gitignore
└── README.md
```

---

## 🎯 Project Goals

- Modular Linux architecture
- CLI-first system administration
- Simple package management through MoDI
- Cloud and DevOps integration
- Security-focused system tooling
- Reproducible OS builds
- Debian compatibility
- Independent bootable releases
- Extensible system modules

---

## 🗺️ Roadmap

### v0.1 — MODI

- [x] Debian-based foundation
- [x] CatalyX CLI
- [x] Modular architecture
- [x] MoDI package interface
- [x] Cloud module
- [x] Security module
- [x] DevOps module
- [x] Network module
- [x] Storage module
- [x] Services module
- [x] Users module
- [x] System module
- [x] Reproducible ISO build
- [x] Bootable Live ISO
- [x] Fresh VM validation
- [x] GitHub Release

### 🔮 Future

- [ ] Installable ISO
- [ ] Expanded MoDI package operations
- [ ] More cloud integrations
- [ ] More security tooling
- [ ] Improved system configuration
- [ ] Automated ISO testing
- [ ] Release automation

---

## 📜 Release Information

| Field | Details |
|---|---|
| **Project** | CatalyX OS |
| **Version** | 0.1 |
| **Codename** | MODI |
| **MoDI** | Modular Distribution Interface |
| **Base** | Debian Trixie 13.6 |
| **Architecture** | amd64 |
| **Release Type** | Bootable Live ISO |

---

<p align="center">
  <b>Built on Debian. Extended by CatalyX.</b>
  <br>
  <i>Modular • CLI-First • Cloud-Native • Open Source</i>
</p>

Application deployement for apprenticeship in EPAI

- [1. Description](#1-description)
- [2. Installation and usage](#2-installation-and-usage)
  - [2.1 Requierments](#21-requierments)
  - [2.2 instructions](#22-instructions)
- [4. Key features](#4-key-features)
- [5. Built with](#5-built-with)
- [6. Credits](#6-credits)

## 1. Description

The purpose of this project is to provide a script that automates the deployment of the applications required for the first year of the computer science program at EPAI Fribourg (Switzerland).

## 2. Installation and usage

### 2.1 Requierments

To run this script, your computer must be running Windows 11 version 25H2.

### 2.2 instructions

- Clone the repository to the folder of your choice
- Open the folder in a new terminal
- Run the script using the following command:

```powershell
& .\Installation_Logiciels_EPAI.ps1
```

## 4. Key features

Running this script installs the packages for the following applications:
- Docker Desktop
    a desktop application for creating and managing containers
- Draw.io
    a diagram design tool
- Git
    a version control tool
- Temurin JDK 25
- Temurin JRE 25
    Java environment
- Pandoc
    a text document conversion tool
- SQLcmd
    a tool for connecting to and managing databases via the command line
- DBeaver Community
    a graphical tool for connecting to and managing databases
- Chocolatey
    an independent package manager
- Wireshark
    a network packet analysis tool
- Remote Desktop Manager
    a remote connection tool

## 5. Built with

This script was written entirely in PowerShell 7.6.4

## 6. Credits

Prepared and documented by Adrien Chavagnat, a first-year apprentice in the Information Technology and Telecommunications Department of the State of Fribourg (Switzerland)
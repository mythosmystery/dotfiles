#!/usr/bin/env python3

import sys
import os

distro = sys.argv[1] or "ubuntu"

def get_install_command():
    match distro:
        case "opensuse":
            return "zypper install -y"
        case "arch":
            return "pacman -S --no-confirm"
    return "apt install -y" 

def install(packages):
    print(f"Installing: {packages}") 
    os.system(f"sudo {get_install_command()} {packages}")


if __name__ == "__main__":
    install("git rustup")
    os.system("rustup default stable")

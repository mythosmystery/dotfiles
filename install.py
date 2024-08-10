#!/usr/bin/env python3

import sys
import os

distro = sys.argv[1] if len(sys.argv) > 1 else  "ubuntu"

has_brew = False

package_override = {
    "ubuntu": {
        "rustup": "snap install --classic"
    }
}

def get_distro_install(distro):
    match distro:
        case "opensuse":
            return "zypper install -y"
        case "arch":
            return "pacman -S --no-confirm"
    return "apt install -y" 

def install(packages):
    install_commands = {
        f"{get_distro_install(distro)}": []
    }

    print(f"Installing: {' '.join(packages)}") 

    if not package_override.__contains__(distro): 
        os.system(f"sudo {get_distro_install(distro)} {' '.join(packages)}")
        return

    for package_name in packages:
        if package_override[distro].__contains__(package_name):
            install_command = package_override[distro][package_name]
            if install_commands.__contains__(install_command):
                install_commands[install_command].append(package_name)
            else:
                install_commands[install_command] = [package_name]
        else:
            install_commands[get_distro_install(distro)].append(package_name)

    for command in install_commands.keys():
        print(f"sudo {command} {' '.join(install_commands[command])}")

    



if __name__ == "__main__":
    install(["git","rustup", "lua", "moreutils"])
    # print(os.system("rustup default stable"))
    

#!/usr/bin/env python3

import sys
import os

##############################################################

#         CONSTANTS

##############################################################

ubuntu = "apt install -y"
opensuse = "zypper install -y"
arch = "pacman -S --no-confirm"
brew = "brew install"
snap = "snap install --classic"
cargo = "cargo install"

distro_arg = sys.argv[1] if len(sys.argv) > 1 else  "ubuntu"


##############################################################

#              PACKAGE_OVERRIDES

##############################################################


install_command_override = {
    f"{brew}": {
        "bat": cargo,
        "exa": cargo,
        "starship": cargo,
        "zoxide": cargo
    }
}

package_override = {
    f"{opensuse}":{"build-essential": ""}, 
}


##############################################################





class Installer:

    distro = "ubuntu"
    has_brew = False


    def __init__(self, distro):
        if distro:
            self.distro = distro


    def run_command(self, command):
        c = f"{self.get_sudo()}{command}"
        # subprocess.run(f"{c}", shell=True)
        print(c)



    def set_brew(self, res):
        if not res:
            self.has_brew = True
        else:
            self.has_brew = False


    def get_sudo(self):
        return "sudo " if self.get_install_command() is not brew else ""



    def get_package_name(self, p):
        command = self.get_install_command()

        if not package_override.__contains__(command):
            return p
        if package_override[command].__contains__(p):
            return package_override[command][p]
        return p

    def map_packages(self, packages):
        return ' '.join(map(self.get_package_name, packages))



    def get_install_command(self):
        if self.has_brew:
            return brew

        match self.distro:
            case "opensuse":
                return opensuse
            case "arch":
                return arch 
        return ubuntu



    def install(self, packages):
        command = self.get_install_command()

        install_commands = {}

        print(f"Installing: {' '.join(packages)}") 

        if not install_command_override.__contains__(command): 
            self.run_command(f"{command} {self.map_packages(packages)}")
            return

        for package_name in packages:
            if install_command_override[command].__contains__(package_name):
                install_command = install_command_override[command][package_name]
                if install_commands.__contains__(install_command):
                    install_commands[install_command].append(self.get_package_name(package_name))
                else:
                    install_commands[install_command] = [self.get_package_name(package_name)]
            else:
                install_commands[command].append(self.get_package_name(package_name))

        for command in install_commands.keys():
            self.run_command(f"{command} {' '.join(install_commands[command])}")

    



if __name__ == "__main__":

    installer = Installer(distro_arg)

    installer.install(["git", "build-essential"])

    # res = os.system('bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')

    installer.set_brew(0)

    os.system('eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"')

    installer.install(["gcc", "cmake", "rustup"])

    os.system("rustup default stable")    

    installer.install(["bat", "exa", "starship", "zoxide"])

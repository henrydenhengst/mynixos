# mynixos
mynixos configuration

minimum requirements current config:
* 4 Gb memory
* 100 Gb harddisk space

What to do to make use of this repository to restore NixOS:

1) Go to the [NixOS website](https://nixos.org/) and [download](https://channels.nixos.org/nixos-22.05/latest-nixos-gnome-x86_64-linux.iso) the latest iso.
2) Install NixOS on your physical or virtual machine.
3) Install `git` like this `nix-env -iA nixos.git`
4) Open a terminal and run `git clone https://github.com/henrydenhengst/mynixos.git`
5) Replace /etc/nixos/configuration.nix with the configuration.nix file in this  repository.
6) Remove `git` like this `nix-env --uninstall git`
7) Change my accountname **henry** to yours in /etc/nixos/configuration.nix
8) Run the command `sudo nixos-rebuild switch`
9) Reboot
10) Login with initial password: *password*
11) Change password!!!
12) Done, ready to go, have fun.

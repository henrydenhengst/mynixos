# mynixos
mynixos configuration

minimum requirements current config:
* 4 Gb memory
* 100 Gb harddisk space

What to do to make use of the configuration.nix file.

1) Go to the [NixOS website](https://nixos.org/) and [download](https://channels.nixos.org/nixos-22.05/latest-nixos-gnome-x86_64-linux.iso) the latest iso.
2) Install NixOS on your physical or virtual machine.
3) Replace /etc/nixos/configuration.nix with the configuration.nix file in this  repository.
4) Change my accountname to yours in /etc/nixos/configuration.nix
5) Run the command `sudo nixos-rebuild switch`
6) Reboot
7) Login with initial password: *password*
8) Change password!!!
9) Done, ready to go, have fun.

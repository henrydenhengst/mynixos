# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "desktop" = {
      computer-icon-visible = false;
      home-icon-visible = false;
      show-orphaned-desktop-icons = false;
      volumes-visible = false;
    };

  };
}

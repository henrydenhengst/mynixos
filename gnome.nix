# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" ];
    };

    "desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "desktop/background" = {
      picture-uri = "file:///home/henry/.config/variety/wallpaper/wallpaper-clock-fc2cecce21fcce9632f251ca262bb7e4.jpg";
      picture-uri-dark = "file:///home/henry/.config/variety/wallpaper/wallpaper-clock-fc2cecce21fcce9632f251ca262bb7e4.jpg";
    };

    "desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "desktop/screensaver" = {
      picture-uri = "file:///home/henry/.config/variety/wallpaper/wallpaper-clock-fc2cecce21fcce9632f251ca262bb7e4.jpg";
    };

    "evolution-data-server" = {
      migrated = true;
      network-monitor-gio-name = "";
    };

    "mutter" = {
      attach-modal-dialogs = true;
      dynamic-workspaces = true;
      edge-tiling = true;
      focus-change-on-pointer-rest = true;
      workspaces-only-on-primary = true;
    };

    "shell" = {
      welcome-dialog-last-shown-version = "42.2";
    };

    "terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      background-color = "rgb(0,43,54)";
      font = "SpaceMono Nerd Font 16";
      foreground-color = "rgb(131,148,150)";
      use-system-font = false;
      use-theme-colors = false;
    };

  };
}

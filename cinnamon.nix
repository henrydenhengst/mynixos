# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "" = {
      alttab-switcher-delay = 100;
      desklet-snap-interval = 25;
      enabled-applets = [ "panel1:left:0:menu@cinnamon.org:0" "panel1:left:1:show-desktop@cinnamon.org:1" "panel1:left:2:grouped-window-list@cinnamon.org:2" "panel1:right:0:systray@cinnamon.org:3" "panel1:right:1:xapp-status@cinnamon.org:4" "panel1:right:2:notifications@cinnamon.org:5" "panel1:right:3:printers@cinnamon.org:6" "panel1:right:4:removable-drives@cinnamon.org:7" "panel1:right:5:keyboard@cinnamon.org:8" "panel1:right:6:favorites@cinnamon.org:9" "panel1:right:7:network@cinnamon.org:10" "panel1:right:8:sound@cinnamon.org:11" "panel1:right:9:power@cinnamon.org:12" "panel1:right:10:calendar@cinnamon.org:13" ];
      enabled-desklets = [];
      next-applet-id = 14;
      panel-zone-symbolic-icon-sizes = "[{\"panelId\": 1, \"left\": 28, \"center\": 28, \"right\": 16}]";
      panels-height = [ "1:40" ];
      startup-animation = false;
    };

    "cinnamon-session" = {
      quit-time-delay = 60;
    };

    "desktop/a11y/keyboard" = {
      bouncekeys-delay = 300;
      mousekeys-accel-time = 300;
      mousekeys-init-delay = 300;
      mousekeys-max-speed = 10;
      slowkeys-delay = 300;
    };

    "desktop/a11y/mouse" = {
      dwell-threshold = 10;
      dwell-time = 1.2;
      secondary-click-time = 1.2;
    };

    "desktop/applications/calculator" = {
      exec = "gnome-calculator";
    };

    "desktop/applications/terminal" = {
      exec = "terminator";
    };

    "desktop/background" = {
      picture-uri = "file:///home/henry/.config/variety/wallpaper/wallpaper-clock-fc2cecce21fcce9632f251ca262bb7e4.jpg";
    };

    "desktop/background/slideshow" = {
      delay = 15;
      image-source = "directory:///home/henry/Pictures";
    };

    "desktop/interface" = {
      clock-show-date = true;
      cursor-theme = "Vanilla-DMZ";
      gtk-theme = "Mint-Y-Dark-Blue";
      icon-theme = "Mint-Y-Dark-Blue";
      scaling-factor = mkUint32 0;
      text-scaling-factor = 1.0;
    };

    "desktop/media-handling" = {
      autorun-never = false;
    };

    "desktop/screensaver" = {
      lock-enabled = false;
    };

    "desktop/sound" = {
      event-sounds = false;
    };

    "desktop/wm/preferences" = {
      min-window-opacity = 30;
      theme = "vimix";
    };

    "launcher" = {
      check-frequency = 300;
      memory-limit = 2048;
    };

    "muffin" = {
      resize-threshold = 24;
      tile-hud-threshold = 25;
    };

    "settings-daemon/plugins/power" = {
      button-power = "shutdown";
      lock-on-suspend = false;
    };

  };
}
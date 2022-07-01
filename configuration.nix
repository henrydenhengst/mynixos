# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# variables
let
  user="henry"
in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  # initrd.kernelModules = ["amdgpu"]
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;
  # boot.loader.grub.efiSupport = true;
  boot.loader.grub.configurationLimit = 5;
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 5;


  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "nl_NL.utf8";


  # Enable the Cinnamon Desktop Environment.
  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "euro";
      displayManager = {
        lightdm.enable = true;
        defaultSession = "cinnamon";
      };
      desktopManager.cinnamon.enable = true;
      windowManager.awesome.enable = true;
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.henry = {
    isNormalUser = true;
    description = "henry";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" "scanner" ];
    initialPassword = "password";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    firefox
    google-chrome
    signal-desktop
    ardour
    asciinema
    bat
    bpytop
    brave
    btop
    clementine
    dmenu
    emacs
    filezilla
    fish
    flameshot
    flatpak
    freetube
    geany
    ghostwriter
    gimp
    git
    gparted
    hddtemp
    hplip
    hplipWithPlugin
    htop
    iftop
    inkscape
    kdenlive
    keepassxc
    kitty
    lbry
    libreoffice
    lshw
    lsof
    micro
    mc
    mpv
    nerdfonts
    nfs-utils
    nmap
    obs-studio
    onionshare
    p7zip
    qbittorrent
    ranger
    remmina
    rsync
    shotcut
    smartmontools
    terminator
    tmux
    tomb
    topgrade
    tor
    tor-browser-bundle-bin
    variety
    ventoy-bin
    vlc
    vnstat
    youtube-dl
    zsh

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
    services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}



#  # automatic upgrade
#  system.autoUpgrade = {
#    enable = true;
#    channel = "https://nixos.org/channels/nixos-22.05";
#  };


#  # clean system
#  nix = {
#    settings.auto-optimise-store = true;
#    gc = {
#       automatic = true;
#       dates = "weekly";
#       options = "--delete-older-than 7d"
#    };
#  };



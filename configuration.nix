# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

### variables
# let
#   user="henry"
# in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # <home-manager/nixos>
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
  users = {
    mutableUsers = true;
    users.henry = {
      isNormalUser = true;
      description = "henry";
      extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" "scanner" ];
      # You can keep the initialPassword if you *really* want to, but
      # that risks forgetting to change it
      # initialPassword = "password";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    
    ### GTK Themes
    vimix-gtk-themes
    stilo-themes
    zuki-themes
    kitty-themes
    
    ### Audio & Video
    ardour
    clementine
    # davinci-resolve
    freetube
    kdenlive
    kodi
    lbry
    mpv
    obs-studio
    vlc

    ### Developer Tools
    emacs   # https://search.nixos.org/options?query=emacs
    vim     # .vimrc
    geany
    micro
    vscodium 
    
    ### Games
    steam
    retroarchFull
    zeroad
    xonotic
    minetest   # https://search.nixos.org/options?channel=22.05&from=0&size=50&sort=relevance&type=packages&query=minetest
    minecraft   # https://search.nixos.org/options?channel=22.05&from=0&size=50&sort=relevance&type=packages&query=minecraft
    endless-sky
    flare
    astromenace
    redeclipse
    superTuxKart
    lincity
    extremetuxracer
    urbanterror
    speed_dreams
    torcs
    bottles
    lutris
    
    
    ### Graphics & Photography
    inkscape
    gimp
    blender
    darktable
    flameshot
    
    ### Communication / Internet / News
    brave
    firefox
    google-chrome
    signal-desktop
    tor
    tor-browser-bundle-bin
    onionshare
    
    ### Productivity
    exodus
    ghostwriter
    libreoffice
    marktext
    monero-gui
    
    ### Science / System / Utilities / Security
    aircrack-ng
    arp-scan
    asciinema
    atuin
    bat
    bettercap
    bpytop
    broot
    btop
    burpsuite
    crunch
    curl
    dconf
    dconf2nix
    dirb
    dmenu
    du-dust
    exa
    fd
    filezilla
    fish
    flatpak
    fundoc
    git
    gparted
    hash-identifier
    hashcat
    hddtemp
    hplip
    hplipWithPlugin
    htop
    httrack
    iftop
    john
    keepassxc
    kitty
    lshw
    lsof
    macchanger
    mc
    nerdfonts
    nikto
    nitrogen
    nfs-utils # https://github.com/NixOS/nixpkgs/blob/nixos-22.05/nixos/modules/tasks/filesystems/nfs.nix
    metasploit
    nmap
    p7zip
    procs
    proxychains
    qbittorrent
    ranger
    remmina
    ripgrep
    rsync # https://search.nixos.org/options?channel=22.05&from=0&size=50&sort=relevance&type=packages&query=rsync
    rustscan
    shotcut
    smartmontools
    socialscan
    sqlmap
    starship
    t-rec
    terminator
    thc-hydra
    tmux # optition = https://search.nixos.org/options?channel=22.05&from=0&size=50&sort=relevance&type=packages&query=tmux + https://github.com/tmux-plugins/tmux-resurrect
    tokei
    tomb
    topgrade
    traceroute
    tre-command
    variety
    ventoy-bin
    vnstat
    wezterm # Alternative Variety ? https://gist.github.com/Drallas/a496282dabcd2a5d781263a05a0ba266 
    wget
    whatweb
    whois
    wireshark # https://search.nixos.org/options?channel=22.05&from=0&size=50&sort=relevance&type=packages&query=wireshark
    wpscan
    youtube-dl
    yt-dlp
    zsh # https://search.nixos.org/options?channel=22.05&from=0&size=50&sort=relevance&type=packages&query=zsh
    
    
    ### Programming Languages / SQL / Webserver
    docker
    docker-compose
    
    ### Wallpapers
    # https://darknetdiaries.com/wallpaper/

  ];
  
  ### Kodi + Plugins
  services.xserver.desktopManager.kodi.enable = true;
  # services.xserver.desktopManager.kodi.package = kodi.withPackages (pkgs: with pkgs; [ osmc-skin ]);
  
  ### RetroArch
  services.xserver.desktopManager.retroarch.enable = true;
  
  ### Steam
  programs.steam.enable = true;
  
  ### Dconf
  programs.dconf.enable = true;
  
  ### Starship
  programs.starship.enable = true;
  # programs.starship.settings  https://github.com/NixOS/nixpkgs/blob/nixos-22.05/nixos/modules/programs/starship.nix
  
  ### Vim
  # programs.vim.package = true;
  programs.vim.defaultEditor = true;
  
  ### vnstat
  services.vnstat.enable = true;
  
  ### traceroute
  programs.traceroute.enable = true;
  
  ### Docker
  virtualisation.docker.enable = true;
  ## Default delivery with Kali Linux https://hub.docker.com/r/kalilinux/kali-rolling
  ## https://www.kali.org/docs/containers/official-kalilinux-docker-images/
  
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

### automatic upgrade
  system.autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-22.05";
  };

### clean system
nix = {
  settings.auto-optimise-store = true;
  gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
};

### DO NOT EDIT BELOW THIS LINE ###

}

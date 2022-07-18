# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

### variables
# let
#   user="henry"
# in

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # <home-manager/nixos>
    ];

  # Bootloader.
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Define your hostname.
  networking.hostName = "oslo"; 
  # Enables wireless support via wpa_supplicant.
  networking.wireless.enable = true;  

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
    jack.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    mutableUsers = true;
    users.henry = {
      isNormalUser = true;
      description = "Henry den Hengst";
      extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" "scanner" ];
      # You can keep the initialPassword if you *really* want to, but
      # that risks forgetting to change it
      initialPassword = "password";
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
    dracula-theme
    
    ### Fonts
    open-fonts
    nerdfonts
    terminus-nerdfont
    inconsolata-nerdfont
    google-fonts
    powerline-fonts
    vistafonts
    corefonts
    redhat-official-fonts
    textfonts
    liberation_ttf
    freefont_ttf
    roboto-mono
    ultimate-oldschool-pc-font-pack
    libre-caslon
    
    ### Audio & Video
    ardour
    clementine
    deadbeef
    freetube
    kdenlive
    kodi
    lbry
    mpv
    obs-studio
    droidcam
    vlc

    ### Developer Tools
    emacs   
    vim
    geany
    micro
    vscodium 
    
    ### Games
    steam
    retroarchFull
    zeroad
    xonotic
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
    # google-chrome
    signal-desktop
    element-desktop
    lynx
    # tor
    # tor-browser-bundle-bin
    # onionshare
    
    ### Productivity
    exodus
    ghostwriter
    libreoffice
    marktext
    obsidian
    monero-gui
    
    ### Science / System / Utilities / Security
    aircrack-ng
    arp-scan
    asciinema
    atuin
    bash
    bat
    bettercap
    bpytop
    broot
    btop
    burpsuite
    coreutils
    crunch
    curl
    dconf
    dconf2nix
    dirb
    dmenu
    dnsutils
    du-dust
    exa
    fd
    file
    filezilla
    fish
    flatpak
    fundoc
    ghostscript
    git
    gnupg
    gparted
    gphoto2
    hash-identifier
    hashcat
    hddtemp
    hdf5
    hplip
    hplipWithPlugin
    htop
    httrack
    iftop
    imagemagick
    jmtpfs
    john
    keepassxc
    killall
    kitty
    libmtp
    lshw
    lsof
    macchanger
    mc
    metasploit
    mkpasswd
    mtpfs
    nethogs
    nfs-utils # https://github.com/NixOS/nixpkgs/blob/nixos-22.05/nixos/modules/tasks/filesystems/nfs.nix
    nikto
    nitrogen
    nix-index
    nix-prefetch-git
    nmap
    ntfs3g
    openvpn
    p7zip
    pandoc
    pdf2svg
    pptp
    procs
    proxychains
    qbittorrent
    ranger
    redshift
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
    tmux 
    tmuxPlugins.dracula
    tmuxPlugins.resurrect
    tmuxPlugins.tilish
    tokei
    tomb
    topgrade
    traceroute
    tre-command
    unrar
    unzip
    variety
    vbetool
    ventoy-bin
    vnstat
    wezterm
    wget
    whatweb
    whois
    wireshark
    wpscan
    xclip  # system clipboard support for vim
    yadm
    yle-dl
    youtube-dl
    yt-dlp
    zip
    zsh
    # malcontent     # parental control
    # malcontent-ui  # parental control


    
    ### Programming Languages / SQL / Webserver
    docker
    docker-compose

  ];
  
  ### List services that you want to enable:
  
  ### Kodi + Plugins
  services.xserver.desktopManager.kodi.enable = true;
  # services.xserver.desktopManager.kodi.package = kodi.withPackages (pkgs: with pkgs; [ osmc-skin ]);
  
  ### RetroArch
  services.xserver.desktopManager.retroarch.enable = true;
  
  ### parental control
  # services.malcontent.enable = true;
  
  ### Steam
  programs.steam.enable = true;
  
  ### Droidcam
  programs.droidcam.enable = true;
  
  ### wireshark
  programs.wireshark.enable = true;
  
  ### Dconf
  programs.dconf.enable = true;
  
  ### Starship
  programs.starship.enable = true;
  # programs.starship.settings  [ ]
  
  ### Git
  programs.git.enable = true;
  
  ### Vim
  # programs.vim.package = true;
  programs.vim.defaultEditor = true;
  
  ### emacs
  services.emacs.enable = true;
  services.emacs.install = true;
  
  ### vnstat
  services.vnstat.enable = true;
  
  ### traceroute
  programs.traceroute.enable = true;  
  
  ### tmux
  programs.tmux.enable = true;
  
  programs.tmux.plugins = with pkgs.tmuxPlugins; [
    resurrect
    tilish
    dracula
  ];

  #programs.tmux.plugins = with pkgs; [
  #  tmuxPlugins.resurrect
  #  tmuxPlugins.tilish
  #  tmuxPlugins.dracula
  #];

  #programs.tmux.plugins = [
  #  pkgs.tmuxPlugins.resurrect
  #  pkgs.tmuxPlugins.tilish
  #  pkgs.tmuxPlugins.dracula
  #];
  
  ### bash
  programs.bash.enableCompletion = true;
  programs.bash.enableLsColors = true;
  
  ### zsh
  # programs.zsh.enable = true;
  # programs.zsh.enableCompletion = true;
  # programs.zsh.syntaxHighlighting.enable = true;
  # programs.zsh.autosuggestions.enable = true;
  # programs.zsh.ohMyZsh.enable = true;
  
  ### fish
  # programs.fish.enable = true;
  
  ### Fonts Settings
  fonts.enableGhostscriptFonts = true;
  fonts.fonts = with pkgs; [ open-fonts nerdfonts terminus-nerdfont inconsolata-nerdfont google-fonts powerline-fonts vistafonts corefonts redhat-official-fonts textfonts liberation_ttf freefont_ttf roboto-mono ultimate-oldschool-pc-font-pack libre-caslon ];
  
  ### Docker
  virtualisation.docker.enable = true;
  ## Default delivery with Kali Linux https://hub.docker.com/r/kalilinux/kali-rolling
  ## https://www.kali.org/docs/containers/official-kalilinux-docker-images/

  ### Enable the OpenSSH daemon.
  services.openssh.enable = true;  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Firewall
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

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
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  ### Home-Manager to install pkgs for a user, and configuration of dotfiles etc
  # home-manager.user.henry = { pkgs, ... }: {
  #   home.packages = with pkgs; [ htop vim ];
  #   home.file = {
  #     ".config/alacritty/alacritty.yml".txt = ' '
  #       {"font":{bold":{"style":"Bold"}}}
  #     ' ';
  #   };
  #   home.file.".doom.d" = {
  #     source ./doom.d;
  #     recursive = true;
  #     onChange = buildins.readFile ./doom.sh;
  #   };
  #   home.file.".config/polybar/script/mic.sh"={
  #     source = ./mic.sh;
  #     executable = true;
  #   };
  # };

  ### Flakes
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  ### System State Version
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

### DO NOT EDIT BELOW THIS LINE ###

}

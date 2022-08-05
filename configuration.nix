# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # <home-manager/nixos>
    ];

  # Bootloader, check these hardware settings before you copy!
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Define your network
    networking = { 
      hostName = "oslo";
      domain = "viking.lan";
      search = [ "viking.lan" ];
      networkmanager.enable = true;
    };

  # Enables wireless support via wpa_supplicant.
  # networking.wireless.enable = true;  

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

  # Enable CUPS to print documents for HP
  services.printing = {
    enable = true;
    drivers = with pkgs; [ hplip hplipWithPlugin ];    
    # canon-cups-ufr2 carps-cups 
    # gutenprint
  };
  programs.system-config-printer.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  

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
      extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" "scanner" "docker" "kvm" "wireshark" "vnstat" "lightdm" ];
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
    
    ### awesome wm
    alacritty
    arandr
    conky
    dmenu
    feh
    librewolf
    mpc-cli
    mpc-qt
    mpc123
    mpd
    ncmpcpp
    neocomp
    neofetch
    networkmanagerapplet
    nitrogen
    picom
    polybar
    scrot
    slock
    unclutter
    volumeicon
    xorg.xbacklight
    xsel
    
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
    soundconverter
    lmms
    kazam
    simplescreenrecorder
    handbrake
    
    ### Kodi Packages
    kodiPackages.kodi
    kodiPackages.six
    kodiPackages.idna
    kodiPackages.iagl
    kodiPackages.trakt
    kodiPackages.arrow
    kodiPackages.kodi-six
    kodiPackages.keymap
    kodiPackages.future
    kodiPackages.youtube
    kodiPackages.urllib3
    kodiPackages.svtplay
    kodiPackages.signals
    kodiPackages.routing
    kodiPackages.pvr-hts
    kodiPackages.netflix
    kodiPackages.chardet
    kodiPackages.certifi
    kodiPackages.vfs-sftp
    kodiPackages.requests
    kodiPackages.myconnpy
    kodiPackages.libretro
    kodiPackages.joystick
    kodiPackages.jellyfin
    kodiPackages.dateutil
    kodiPackages.websocket
    kodiPackages.pdfreader
    kodiPackages.osmc-skin
    kodiPackages.orftvthek
    kodiPackages.invidious
    kodiPackages.xbmcswift2
    kodiPackages.simplejson
    kodiPackages.defusedxml
    kodiPackages.kodi-platform
    kodiPackages.trakt-module
    kodiPackages.arteplussept
    kodiPackages.archive_tool
    kodiPackages.a4ksubtitles
    kodiPackages.steam-library
    kodiPackages.pvr-hdhomerun
    kodiPackages.libretro-mgba
    kodiPackages.vfs-libarchive
    kodiPackages.steam-launcher
    kodiPackages.requests-cache
    kodiPackages.pvr-iptvsimple
    kodiPackages.libretro-snes9x
    kodiPackages.steam-controller
    kodiPackages.libretro-genplus
    kodiPackages.inputstream-rtmp
    kodiPackages.typing_extensions
    kodiPackages.inputstreamhelper
    kodiPackages.inputstream-adaptive
    kodiPackages.inputstream-ffmpegdirect
    kodiPackages.controller-topology-project

    ### Developer Tools
    # emacs   
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
    grapejuice # this is really Roblox !
    
    
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
    discord
    shortwave
    slack
    lynx
    # tor
    # tor-browser-bundle-bin
    # onionshare
    
    ### Productivity
    exodus
    ghostwriter
    libreoffice
    simplenote
    foliate
    qalculate-gtk
    monero-gui
    
    ### Science / System / Utilities / Privacy / Security
    # bpytop
    # flatpak
    # htop
    # kitty
    # malcontent     # parental control
    # malcontent-ui  # parental control
    # thunderbird
    # wezterm
    aircrack-ng
    ansible # Deployment done right
    appimage-run
    arp-scan
    asciinema
    atuin
    bash
    bash-completion
    bash-preexec
    bashdb
    bashSnippets
    bat
    bettercap
    binutils
    broot
    btop
    burpsuite
    cachix # Nix build cache
    coreutils
    crunch
    curl
    dbus
    dconf
    dconf2nix
    dirb
    dmidecode
    dnsutils
    dnstop
    du-dust
    ethtool
    exa
    fd
    ffmpeg
    file
    filezilla
    fish
    fundoc
    geekbench
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
    httrack
    iftop
    imagemagick
    ipfs
    jmtpfs
    john
    keepassxc
    killall
    libmtp
    lorri # Easy Nix shell
    lshw
    lsof
    macchanger
    mc
    metasploit
    mkpasswd
    mtpfs
    mtr
    nethogs
    nfs-utils # https://github.com/NixOS/nixpkgs/blob/nixos-22.05/nixos/modules/tasks/filesystems/nfs.nix
    nikto
    niv # Nix dependency management
    nix-bash-completions
    nix-index
    nix-prefetch-git
    nixos-generators
    nmap
    ntfs3g
    openvpn
    p7zip
    pandoc
    pciutils
    pdf2svg
    pptp
    procs
    proxychains
    pulumi-bin # Infrastructure as code
    pythonFull
    python3Full
    qbittorrent
    ranger
    redshift
    remmina
    ripgrep
    rsync # https://search.nixos.org/options?channel=22.05&from=0&size=50&sort=relevance&type=packages&query=rsync
    rustdesk
    rustscan
    smartmontools
    socialscan
    sqlmap
    starship
    t-rec
    tcpdump
    tealdeer # tldr for various shell tools
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
    tree
    unrar
    unzip
    usbutils
    variety
    vbetool
    ventoy-bin
    vnstat
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
    zola # Static site generator written in Rust
    zsh
    
    ### Virtualization
    docker
    docker-compose

  ];
  
  ### List services that you want to enable:
  
  ### Kodi + Plugins
  services.xserver.desktopManager.kodi.enable = true;
  services.xserver.desktopManager.kodi.package = pkgs.kodi.withPackages (pkgs: with pkgs; [ osmc-skin ]);   
  
  ### RetroArch
  services.xserver.desktopManager.retroarch.enable = true;
  
  ### Steam
  programs.steam.enable = true;
  
  ### Droidcam
  programs.droidcam.enable = true;
  
  ### parental control
  # services.malcontent.enable = true;
  
  ### wireshark
  programs.wireshark.enable = true;
  
  ### IPFS
  services.ipfs.enable = true;
  
  ### Dconf
  programs.dconf.enable = true;
  
  ### Starship
  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = false;
    format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
    shlvl = {
      disabled = false;
      symbol = "ﰬ";
      style = "bright-red bold";
    };
    shell = {
      disabled = false;
      format = "$indicator";
      fish_indicator = "";
      bash_indicator = "[BASH](bright-white) ";
      zsh_indicator = "[ZSH](bright-white) ";
    };
    username = {
      style_user = "bright-white bold";
      style_root = "bright-red bold";
    };
    hostname = {
      style = "bright-green bold";
      ssh_only = true;
    };
    nix_shell = {
      symbol = "";
      format = "[$symbol$name]($style) ";
      style = "bright-purple bold";
    };
    git_branch = {
      only_attached = true;
      format = "[$symbol$branch]($style) ";
      symbol = "שׂ";
      style = "bright-yellow bold";
    };
    git_commit = {
      only_detached = true;
      format = "[ﰖ$hash]($style) ";
      style = "bright-yellow bold";
    };
    git_state = {
      style = "bright-purple bold";
    };
    git_status = {
      style = "bright-green bold";
    };
    directory = {
      read_only = " ";
      truncation_length = 0;
    };
    cmd_duration = {
      format = "[$duration]($style) ";
      style = "bright-blue";
    };
    jobs = {
      style = "bright-green bold";
    };
    character = {
      success_symbol = "[\\$](bright-green bold)";
      error_symbol = "[\\$](bright-red bold)";
    };
  };
  
  ### Git
  programs.git.enable = true;
  
  ### Vim
  # programs.vim.package = true;
  programs.vim.defaultEditor = true;
  
  ### emacs
  # services.emacs.enable = true;
  # services.emacs.install = true;
  
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

  ### bash
  programs.bash.enableCompletion = true;
  programs.bash.enableLsColors = true;
  
  ### zsh
  programs.zsh.enable = true;
  # programs.zsh.enableCompletion = true;
  # programs.zsh.syntaxHighlighting.enable = true;
  # programs.zsh.autosuggestions.enable = true;
  # programs.zsh.ohMyZsh.enable = true;
  
  ### fish
  programs.fish.enable = true;
  
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

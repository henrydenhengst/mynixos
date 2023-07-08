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

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Define your network
    networking = {
      hostName = "stavanger";
      domain = "viking.lan";
      search = [ "viking.lan" ];
      networkmanager.enable = true;
    };

  # Enables wireless support via wpa_supplicant.
  # networking.wireless.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "nl_NL.utf8";
  console = {
    packages=[ pkgs.terminus_font ];
    font="${pkgs.terminus_font}/share/consolefonts/ter-i22b.psf.gz";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  # Enable the KDE Plasma 5 Desktop Environment.
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

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
  hardware.opengl.driSupport32Bit = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
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
    users.yourname = {
      isNormalUser = true;
      description = "First Name - Last Name";
      extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" "scanner" "wireshark" "vnstat" "sddm" ];
      # You can keep the initialPassword if you *really* want to, but
      # that risks forgetting to change it
      initialPassword = "ComplicatedPassword!!!";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

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
    kitty
    neofetch

    ### Audio & Video
    freetube
    kdenlive
    lbry
    mpv
    obs-studio
    vlc
    soundconverter
    kazam
    simplescreenrecorder
    handbrake

    ### Developer Tools
    # emacs
    vim
    geany
    micro

    ### Graphics & Photography
    inkscape
    gimp
    blender
    darktable
    flameshot

    ### Communication / Internet / News
    brave
    firefox
    signal-desktop
    lynx

    ### Productivity
    ghostwriter
    libreoffice
    simplenote
    foliate

    ### Science / System / Utilities / Privacy / Security
    arp-scan
    asciinema
    atuin
    bc
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
    dirb
    dmidecode
    dnsutils
    du-dust
    ethtool
    exa
    fd
    ffmpeg
    file
    filezilla
    fish
    flatpak
    fundoc
    gcc
    geekbench
    ghostscript
    git
    gnupg
    gnugrep
	  gnumake
    gparted
    hash-identifier
    hashcat
    hddtemp
    hdf5
    hplip
    hplipWithPlugin
    httrack
    iftop
    imagemagick
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
    tldr
    tmux
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
  ];

  ### List services that you want to enable:

  ### wireshark
  programs.wireshark.enable = true;

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

  ### vnstat
  services.vnstat.enable = true;

  ### traceroute
  programs.traceroute.enable = true;

  ### tmux
  programs.tmux.enable = true;

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
  
  # enable flatpak support
  services.flatpak.enable = true;
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    # wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  ### Fonts Settings
  fonts.enableGhostscriptFonts = true;
  fonts.fonts = with pkgs; [ open-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji font-awesome nerdfonts terminus-nerdfont inconsolata-nerdfont google-fonts powerline-fonts vistafonts corefonts redhat-official-fonts textfonts liberation_ttf freefont_ttf roboto-mono ultimate-oldschool-pc-font-pack libre-caslon ];
  

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
      channel = "https://nixos.org/channels/nixos-23.05";
  };
  
  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;
  system.autoUpgrade.allowReboot = true; 


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

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./vim.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp2s0.useDHCP = false;
  networking.interfaces.wlp3s0.useDHCP = false;
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";

  time.timeZone = "Europe/Moscow";  
  i18n.defaultLocale = "ru_RU.UTF-8";

  nixpkgs.config.allowUnfree = true;

  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.libinput.enable = true;
 
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT="powersave";
      CPU_SCALING_GOVERNOR_ON_AC="performance";
    };
  };
   
  services.flatpak.enable = true;
  xdg.portal.enable = true;


  fonts.fonts = with pkgs; [
    fantasque-sans-mono
  ];
  
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.acpilight.enable = true;


  users.users.vlad.packages = with pkgs;
  [
    vulkan-tools
    amdvlk
  ];

  users.users.vlad = {
    home = "/home/vlad";
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "networkmanager" ]; 
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    numDevices = 1;
  
  };

  programs.zsh.enable = true;
  programs.steam.enable = true;
  users.extraUsers.vlad = {
    shell = pkgs.zsh;
  };
  
  security.sudo.extraRules = [
    { users = [ "vlad" ];
      commands = [
        { command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget vim git polybar alacritty picom neofetch feh flameshot rofi dunst
    firefox nnn zsh spotify rocm-opencl-icd amdvlk htop python3 curl psmisc xorg.xbacklight
  ];
   
  nixpkgs.config = {
    packageOverrides = pkgs: rec {
      polybar = pkgs.polybar.override {
        i3Support = true;
        pulseSupport = true;
      };
    };
  };
  
  environment.variables.VK_ICD_FILENAMES =
   "/run/opengl-driver/share/vulkan/icd.d/amd_icd64.json";
  
  system.stateVersion = "20.09"; # Did you read the comment?

}


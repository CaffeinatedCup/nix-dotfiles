## Liberator ##
## System76 Darter Pro with NixOS and Windows ##

{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/optional/server.nix
    ../../nixos/core
  ];

  networking.hostName = "liberator";

  hardware.system76.enableAll = true;

  programs.zsh.enable = true;
  programs.starship = {
    enable = true;
    settings = {
      line_break.disabled = true;
      add_newline = false;
    };
  };
  
  environment.variables = {
    TERM = "xterm-256color";
  };

  # Power saving for server
  powerManagement = {
  enable = true;
  cpuFreqGovernor = "powersave";  # or "schedutil" for dynamic adjustment
};

services.tlp = {
  enable = true;
  settings = {
    CPU_SCALING_GOVERNOR_ON_AC = "powersave";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    WIFI_PWR_ON_AC = "on";
    WIFI_PWR_ON_BAT = "on";
    RUNTIME_PM_ON_AC = "auto";
    RUNTIME_PM_ON_BAT = "auto";
  };
};

  # Keep laptop on while lid is closed
  services.logind = {
  lidSwitch = "ignore";
  lidSwitchDocked = "ignore";
  lidSwitchExternalPower = "ignore";
  };


  # UEFI boot
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
}


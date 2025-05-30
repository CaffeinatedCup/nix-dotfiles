{ config, lib, pkgs, ... }:

{
  # For sound, bluetooth, and peripherals

  #TODO xppen drivers, logitech mouse, and maybe gui's for changing stuff like audio output

  # Enable USB device connection
  services.udisks2.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
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

    # Sound related packages
    environment.systemPackages = with pkgs; [
      pamixer
      pavucontrol
    ];
}

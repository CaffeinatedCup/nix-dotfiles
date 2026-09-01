{ config, lib, pkgs, ... }:

{
  # For sound, bluetooth, and peripherals

  #TODO xppen drivers, logitech mouse, and maybe gui's for changing stuff like audio output

  # USB permission stuff for plugging in microcontrollers
  services.udev.packages = [ pkgs.stlink pkgs.openocd ];
  services.udev.extraRules = ''
  # STM32 DFU bootloader (Black Pill / ROM bootloader)
  SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE="0666"
<<<<<<< HEAD
=======

  # For logic analyzer
  SUBSYSTEM=="usb", ATTR{idVendor}=="0925", ATTR{idProduct}=="3881", MODE="0660", GROUP="plugdev"
  SUBSYSTEM=="usb", ATTR{idVendor}=="04b4", ATTR{idProduct}=="8613", MODE="0660", GROUP="plugdev"

  # NewAE ChipWhisperer (Lite/Nano/Pro/Husky). Inside the `nix run` FHS
  # sandbox the process keeps its UID but supplementary groups (plugdev etc.)
  # are dropped, so group-based rules don't help there. uaccess grants the
  # logged-in user access by UID, BUT the logind ACL is only (re)applied on
  # plug/session events — if the board is already present at boot or across a
  # nixos-rebuild, the ACL is missing and access silently breaks. MODE="0666"
  # makes access deterministic regardless of seat/session/group state (same as
  # the STM32 DFU rule above); uaccess is kept for host-side tooling.
  SUBSYSTEMS=="usb", ATTRS{idVendor}=="2b3e", ATTRS{idProduct}=="*", MODE="0666", TAG+="uaccess"
  SUBSYSTEM=="tty", ATTRS{idVendor}=="2b3e", ATTRS{idProduct}=="*", TAG+="uaccess", SYMLINK+="cw_serial%n"
  SUBSYSTEM=="tty", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="6124", TAG+="uaccess", SYMLINK+="cw_bootloader%n"
>>>>>>> 7bcad514c08d245e20e4364a4e32406150e56902
  '';

  services.upower.enable = true;

  services.tuned.enable = true;

  # Enable USB device connection
  services.udisks2.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.dbus.enable = true;

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

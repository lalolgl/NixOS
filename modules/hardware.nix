{ config, pkgs, lib, ... }:

{
  # Enable the X11 windowing system and set the default video drivers
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = true;
  };

  # Kernel modules and parameters
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];
  boot.kernelModules = [
    "nvidia"
    "nvidia_drm"
    "nvidia_modeset"
    "nvidia_uvm"

    "kvm-amd"
    "virtio"         # drivers for паравиртуализации
    "virtio-net"     # ethernet support
    "virtio-blk"     # unit devices
    "virtio-balloon" # cotrol memory
    "virtio-console" # console
  ];

  # Virtualisation
  virtualisation.libvirtd.enable = true;

  # Enable touchpad support
  services.libinput.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
}

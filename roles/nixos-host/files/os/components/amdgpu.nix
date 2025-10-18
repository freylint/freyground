{ pkgs, environment, ... }:
{
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
  };

  hardware.graphics.enable32Bit = true;
}

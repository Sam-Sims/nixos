{ config, pkgs, lib, ... }:
{
  imports = [../../common/proxmox-lxc.nix];
  deployment = {
    targetHost = "192.168.0.13";
    targetPort = 22;
    targetUser = "root";
    buildOnTarget = false;
  };
  time.timeZone = "Europe/London";
  nix.settings = { sandbox = false; };  
  proxmoxLXC = {
    manageNetwork = false;
    privileged = true;
  };
  systemd.mounts = [{
    where = "/sys/kernel/debug";
    enable = false;
  }];
  networking.hostName = "combee";

  environment.systemPackages = with pkgs; [
    htop
  ];

  system.stateVersion = "25.05";
}
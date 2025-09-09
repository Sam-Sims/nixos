{ config, lib, pkgs, ... }:

{
  users.users.sam = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICFGZmFn4dHDWC75RVhf3F5e7J9T1qBRdphgaPHxeg+S sammy@sammy-arch-linux"
    ];
    shell = pkgs.fish;
  };

  home-manager.users.sam = {
    imports = [
      ../../dots/starship
      ../../dots/fish
      ../../dots/fastfetch
      ../../dots/bat
      ../../dots/btop
    ];

    home.username = "sam";
    home.homeDirectory = "/home/sam";

    # home manager packages - packages requring config go in ./dots and are imported above
    programs.home-manager.enable = true;
    programs.eza.enable = true;
    programs.ripgrep.enable = true;
    programs.fd.enable = true;
    programs.fzf.enable = true;
    
    # packages not managed by home manager
    home.packages = with pkgs; [
      pokeget-rs
    ];

    home.stateVersion = "25.05";
  };
}
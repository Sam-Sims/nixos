{ config, lib, home-manager, ... }:

{
  imports = [ home-manager.nixosModules.home-manager ];
  
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };
}
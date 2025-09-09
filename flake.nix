{
  description = "Colmena remote nixos deployment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      pkgsLinux = import nixpkgs { system = "x86_64-linux"; };
      # will build a colmena config for each host configured in ./hosts dir
      hosts = builtins.attrNames (builtins.readDir ./hosts);
      hostConfigs = builtins.listToAttrs (map (hostName: {
        name = hostName;
        value = {
          imports = [
            ./hosts/${hostName}
            ./common/home-manager.nix
          ];
        };
      }) hosts);
    in
    {
      devShells."x86_64-linux".default = pkgsLinux.mkShell {
        buildInputs = with pkgsLinux; [
          colmena
        ];
      };

      colmena = {
        meta = {
          nixpkgs = pkgsLinux;
          specialArgs = { inherit home-manager; };
        };
      } // hostConfigs;
    };
}
{
  description = "Colmena remote nixos deployment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };
  outputs = { nixpkgs, ... }:
    let
      pkgsLinux = import nixpkgs { system = "x86_64-linux"; };
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
        };

        combee = import ./hosts/combee;
      };
    };
}
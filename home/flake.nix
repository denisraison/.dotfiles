{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, flake-utils, ... }:
    flake-utils.lib.eachSystem ([ "x86_64-linux" ]) (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        formatter = pkgs.nixfmt;
        packages = {
          homeConfigurations.raison =
            home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [ ./home.nix ];
            };
        };
      });
}

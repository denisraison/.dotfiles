{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.packages;
in {
  options.modules.packages = { enable = mkEnableOption "packages"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      bat
      eza
      docker
      docker-compose
      gh
      htop
      ipfetch
      keychain
      python39
      nixfmt
      kubectl
      k3d
      k9s
      rustup
      gccgo13
      argocd
      (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.bq])
    ];
  };
}

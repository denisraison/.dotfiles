{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.packages;
in {
  options.modules.packages = { enable = mkEnableOption "packages"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      exa
      docker
      bat
      libnotify
      docker-compose
      gh
      glow
      graalvm17-ce
      graphviz
      htop
      ipfetch
      keychain
      python39
      nixfmt
      emacs
      kubectl
      k3d
      k9s
    ];
  };
}

{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.vscode;
in {
  options.modules.vscode = { enable = mkEnableOption "vscode"; };
  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      mutableExtensionsDir = false;
      extensions = with pkgs.vscode-extensions; [
        golang.go
        rust-lang.rust-analyzer
        bbenoist.nix
        arrterian.nix-env-selector
        hashicorp.terraform
        ms-python.python
        ms-vscode.makefile-tools
        ms-vscode-remote.remote-ssh
        ms-kubernetes-tools.vscode-kubernetes-tools
        ms-azuretools.vscode-docker
        eamodio.gitlens
        astro-build.astro-vscode
        dart-code.flutter
        dart-code.dart-code
        redhat.vscode-yaml

        genieai.chatgpt-vscode
      ];
    };
  };
}

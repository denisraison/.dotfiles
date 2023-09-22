{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.vscode;
in {
  options.modules.vscode = { enable = mkEnableOption "vscode"; };
  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
	golang.go
	rust-lang.rust-analyzer
	bbenoist.nix
	hashicorp.terraform
	ms-python.python
	ms-vscode.makefile-tools
	ms-vscode-remote.remote-ssh
      ];
    };
  };
}

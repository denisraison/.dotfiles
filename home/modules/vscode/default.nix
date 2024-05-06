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
        humao.rest-client
        genieai.chatgpt-vscode
        hashicorp.hcl
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "volar";
        publisher = "vue";
        version = "2.0.12";
        sha256 = "sha256-uTMOaE/IInT4V6AZb83eoviKO5adiMybIEQkS4pVEcw=";
      }
      {
        name = "copilot";
        publisher = "GitHub";
        version = "1.186.856";
        sha256 = "sha256-AMzSDLBCQ2F48u14eRrf/QnIc9mwXwrUj4JvTdWEN+E=";
      }
      {
        name = "copilot-chat";
        publisher = "GitHub";
        version = "0.15.2024042903";
        sha256 = "sha256-vrA3wIu4K1ZUP/86rugUFGWK1TcJXNtE/oPru/CucvU=";
      }
      {
        name = "playwright";
        publisher = "ms-playwright";
        version = "1.0.22";
        sha256 = "sha256-foTec3GrXsaTkPa9fHaKtPSY/gB86L02AycZmHwxUuI=";
      }
      {
        name = "turbo-console-log";
        publisher = "ChakrounAnas";
        version = "2.10.4";
        sha256 = "sha256-6CMnEGss4XkDau6Wn4equMJWoQtSjMgQ15Y7TK3mZvk=";
      }
    ];
    };
  };
}

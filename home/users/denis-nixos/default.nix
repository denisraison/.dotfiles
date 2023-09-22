{ config, lib, nixpkgs, home-manager, ... }: {
  home = {
    stateVersion = "23.11";
  };

  imports = [ ../../modules/default.nix ];
  modules = {
    direnv.enable = true;
    nvim.enable = true;
    zsh.enable = true;
    git.enable = true;
    packages.enable = true;
    vscode.enable = true;
    chromium.enable = true;
  };
}

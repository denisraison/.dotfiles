{ config, lib, inputs, pkgs, ... }: {
  home = {
    stateVersion = "22.11";
    homeDirectory = "/home/raison";
    username = "raison";
    sessionVariables = { };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs = {
    home-manager.enable = true;
    bash = {
      enable = true;
      initExtra = ''
        . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      '';
    };
  };

  imports = [ ../../modules/default.nix ];
  modules = {
    packages.enable = true;
    zsh.enable = true;
    git.enable = true;
    direnv.enable = true;
  };
}

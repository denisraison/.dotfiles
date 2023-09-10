{ self, config, lib, inputs, pkgs, ... }: {
  home = {
    stateVersion = "22.11";
    homeDirectory = "/home/raison";
    username = "raison";
    sessionVariables = {
      NIX_HOME_FLAKE = "$HOME/workspace/dotfiles/home#raison";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs = { home-manager.enable = true; };

  imports = [ ../../modules/default.nix ];
  modules = {
    packages.enable = true;
    zsh.enable = true;
    git.enable = true;
    direnv.enable = true;
    nvim.enable = true;
  };
}

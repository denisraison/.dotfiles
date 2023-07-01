{ config, pkgs, ... }: {
  home = {
    homeDirectory = "/home/raison";
    packages = with pkgs; [
      direnv
      docker
      docker-compose
      gh
      glow
      graalvm17-ce
      graphviz
      gum
      htop
      ipfetch
      keychain
      neovim
      zsh
      python39
    ];

    stateVersion = "22.11";
    username = "raison";
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Denis Raison";
      userEmail = "deeraison@gmail.com";
    };
  };
}

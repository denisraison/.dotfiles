{ lib, config, pkgs, ... }:
with lib;
let cfg = config.modules.nvim;
in {
  options.modules.nvim = { enable = mkEnableOption "nvim"; };
  config = mkIf cfg.enable {
    programs.zsh = {
      shellAliases = {
        v = "nvim -i NONE";
        nvim = "nvim -i NONE";
      };
    };

    programs.neovim = { 
      enable   = true; 
      viAlias  = true; 
      vimAlias = true; 
      vimdiffAlias = true; 
      plugins = with pkgs.vimPlugins; [
	nerdtree
	rainbow
      ]; 
      extraConfig = ''
	set number
	set relativenumber
      '';
    };
  };
}

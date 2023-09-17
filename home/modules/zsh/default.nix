{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.zsh;
in {
  options.modules.zsh = { enable = mkEnableOption "zsh"; };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.zsh ];

    programs.zsh = {
      enable = true;

      # directory to put config files in
      dotDir = ".config/zsh";

      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;

      # .zshrc
      initExtra = ''
        source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

        PROMPT="%F{blue}%m %~%b "$'\n'"%(?.%F{green}%Bλ%b |.%F{red}?) %f"
        RPROMPT="$(git_super_status)"

        export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store";
        export ZK_NOTEBOOK_DIR="~/stuff/notes";
        export DIRENV_LOG_FORMAT="";
        bindkey '^ ' autosuggest-accept

        edir() { tar -cz $1 | age -p > $1.tar.gz.age && rm -rf $1 &>/dev/null && echo "$1 encrypted" }
        ddir() { age -d $1 | tar -xz && rm -rf $1 &>/dev/null && echo "$1 decrypted" }
      '';

      # Tweak settings for history
      history = {
        save = 1000;
        size = 1000;
        path = "$HOME/.cache/zsh_history";
      };

      # Set some aliases
      shellAliases = {
        c = "clear";
        mkdir = "mkdir -vp";
        rm = "rm -rifv";
        mv = "mv -iv";
        cp = "cp -riv";
        cat = "bat --paging=never --style=plain";
        ls = "exa -a --icons";
        tree = "exa --tree --icons";
        nd = "nix develop -c $SHELL";
        rebuild = "home-manager switch --flake $NIX_HOME_FLAKE";
        k = "kubectl";
      };

      # Source all plugins, nix-style
      plugins = [{
        name = "git-prompt";
        file = "./plugins/git-prompt/git-prompt.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "ohmyzsh";
          repo = "ohmyzsh";
          rev = "a482a02915f361e56669ee9884ebee0eb6f2d8d5";
          sha256 = "sha256-d69jiukY6RG5rKmBFCIastMXBar59LJZE/OggY6msn4=";
          sparseCheckout = [ "plugins/git-prompt" ];
        };
      }];
    };
  };
}

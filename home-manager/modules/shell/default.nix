{pkgs, username, ...}: {
  imports = [
    ./starship.nix
    ./tools.nix
  ];
  programs.bash = {
    enable = true;
    initExtra = 
    ''
    zsh ; exit
    '';
  };
  programs.zsh = {
    enable = true;
    autocd = true; # cdなしでファイルパスだけで移動
    enableCompletion = true; # 自動補完
    enableAutosuggestions = true; # 入力サジェスト
    syntaxHighlighting.enable = true; # シンタックスハイライト
    shellAliases = {
      cat = "bat";
      grep = "rg";
      ls = "eza --icons --classify";
      la = "eza --all --icons --classify";
      ll = "eza --long --all --git --icons";
      tree = "eza --icons --classify --tree";
      nix-direnv = "echo 'use flake' >> .envrc && direnv allow";
    };
    initExtra = 
      ''
        # setup peco & ghq
        function peco-src() {
          local selected_dir=$(ghq list -p | peco --prompt="repositories >" --query "$LBUFFER")
          if [ -n "$selected_dir" ]; then
            BUFFER="cd $selected_dir"
            zle accept-line
          fi
          zle clear-screen
        }
        zle -N peco-src
        bindkey '^]' peco-src
      '';
  };
}
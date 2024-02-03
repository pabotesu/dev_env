{pkgs, ...}: {
  programs.git = {
    enable = true;
    # Your git username
    userName = "pabotesu";
    # Your git email
    userEmail = "pab0te2u@gmail.com";
    
    delta.enable = true;

    extraConfig = {
      init.defaultBranch = "main";
      ghq.root = "~/Src";
    };
    
  };

  home.packages = with pkgs; [
    nodePackages.gitmoji-cli
    ghq
    peco
    hub
  ];
}
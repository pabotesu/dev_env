let 
  myuser = "pobotesu";
  myhome = "/home/pabotesu";
in {
  home.username = "${myuser}";
  home.homeDirectory = "${myhome}";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  imports = [
    ./modules/shell
    ./modules/fonts
  ];
}
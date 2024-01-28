let 
  myuser = builtins.getEnv "USER";
  myhome = builtins.getEnv "HOME";
in {
  home.username = "${myuser}";
  home.homeDirectory = "${myhome}";
  home.stateVersion = "23.11";
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  imports = [
    ./modules/shell
    ./modules/fonts
  ];
}
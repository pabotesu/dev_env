{ config, pkgs, users, username, ... }:

let 
  myuser = "pabotesu";
  myhome = "/home/${myuser}";
in {
  home.username = "${myuser}";
  home.homeDirectory = "${myhome}";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      trusted-users = ["root" "${myuser}"];
      accept-flake-config = true;
    };
  };
  imports = [
    ./modules/shell
    ./modules/fonts
    ./modules/tools
  ];
}
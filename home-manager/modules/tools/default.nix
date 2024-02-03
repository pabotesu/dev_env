{pkgs, ...}: {
  imports = [
    ./git.nix
    ./direnv.nix
  ];
  home.packages = with pkgs; [
    eza
    ripgrep
    bat
  ];
}
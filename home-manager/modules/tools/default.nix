{pkgs, ...}: {
  imports = [
    ./git.nix
    ./direnv.nix
  ];
  home.packages = with pkgs; [
    neofetch
    eza
    ripgrep
    bat
  ];
}
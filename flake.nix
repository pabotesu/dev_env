{
  description = " #---# NixOS Configuration for wsl #---#";
  inputs = {
    ### nix ans nix-tools
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    
    ### home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let 
      # system = "aarch64-linux"; If you are running on ARM powered computer
      syste = "x86_64-linux";
      # myuser is your $username
      myuser = builtins.getEnv "USER";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations = {
        "${myuser}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home-manager/default.nix
      };
    };
}

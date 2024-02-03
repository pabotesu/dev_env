# Develop Environment on Nix

## Environment
- Ubntu 22.04 on WSL (Windows11)
- Nix Flakes
- Home-Manager

## Usage
- Advance preparation
    - setup wsl
    - setup Nix - [nix-installer](https://github.com/DeterminateSystems/nix-installer)
    - clone this repository

- First Run
```
nix run nixpkgs#home-manager -- switch -b backup --flake .#pabotesu
```

- Update
```
nix flake update
```
```
home-manager switch --flake .#pabotesu
```
inputs:
let
  mkNixosSystem =
    {
      system,
      hostname,
      username,
      modules,
    }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system modules;
      specialArgs = {
        inherit inputs hostname username;
      };
    };
  mkHomeManagerConfiguration =
    {
      system,
      username,
      overlays,
      modules,
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        inherit system overlays;
        config = {
          allowUnfree = true;
        };
      };
      extraSpecialArgs = {
        inherit inputs username;
        pkgs-stable = import inputs.nixpkgs-stable {
          inherit system overlays;
          config = {
            allowUnfree = true;
          };
        };
      };
      modules = modules ++ [
        {
          home = {
            inherit username;
            homeDirectory = "/home/${username}";
            stateVersion = "24.11";
          };
          programs.home-manager.enable = true;
          programs.git.enable = true;
        }
      ];
    };
in
{
  nixos = {
    desktop = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "nixos-desktop";
      username = "sho";
      modules = [ ./desktop/nixos.nix ];
    };
    wsl = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "nixos-wsl";
      username = "sho";
      modules = [ ./wsl/nixos.nix ];
    };
  };
  home = {
    desktop = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "sho";
      overlays = [
        inputs.fenix.overlays.default
        inputs.emacs-overlay.overlays.package
        inputs.emacs-overlay.overlays.emacs
      ];
      modules = [ ./desktop/home.nix ];
    };
    wsl = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "sho";
      overlays = [
        inputs.fenix.overlays.default
        inputs.emacs-overlay.overlays.package
        inputs.emacs-overlay.overlays.emacs
      ];
      modules = [ ./wsl/home.nix ];
    };
  };
}

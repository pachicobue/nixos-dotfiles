{ pkgs, ... }:
{
  imports = [
    ./atuin.nix
    ./bat.nix
    ./bottom.nix
    ./direnv.nix
    ./fastfetch.nix
    ./fd.nix
    ./fzf.nix
    ./git.nix
    ./helix.nix
    ./lazygit.nix
    ./ripgrep.nix
    ./starship.nix
    ./zsh.nix
    ./zoxide.nix

    ./nushell
    ./zellij
  ];
  home.packages = [
    pkgs.wl-clipboard
    pkgs.du-dust
    pkgs.procs
    pkgs.xh
  ];
}

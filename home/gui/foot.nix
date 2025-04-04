{ pkgs, ... }:
{
  home.packages = [
    pkgs.libsixel
  ];
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "Moralerspace Neon NF:size=12";
        dpi-aware = "yes";
      };
      cursor = {
        style = "beam";
        blink = "yes";
      };
      colors = {
        alpha = 0.8;
      };
    };
  };
}

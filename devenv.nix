{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.nodejs-16_x
    pkgs.nodePackages.pnpm
  ];


  enterShell = ''
    pnpm install
  '';

  processes = {
    dev.exec = "pnpm dev";
  };

  # https://devenv.sh/languages/
  languages.nix.enable = true;

}

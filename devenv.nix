{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [ pkgs.git pkgs.nodejs-16_x ];


  enterShell = ''
    npm install
  ''
  # https://devenv.sh/languages/
  languages.nix.enable = true;
  languages.typescript.enable = true;

}

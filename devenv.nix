{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = [ pkgs.git pkgs.nodejs-16_x ];


  enterShell = ''
    npm install
    npm i -g pnpm
  '';

  processes = {
    dev.exec = "npm run dev";
  };

  # https://devenv.sh/languages/
  languages.nix.enable = true;

}

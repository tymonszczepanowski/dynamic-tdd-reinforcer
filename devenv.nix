#!nix
{ config, pkgs, ... }:
{
  packages = [
    pkgs.stdenv.cc.cc.lib
    # pkgs.cudaPackages.cudatoolkit -> to verify if gpu support can be enabled
  ];

  languages.python = {
    enable = true;
    package = pkgs.python311;
    poetry.enable = true;
    poetry.install.enable = true;
  };

  scripts.gds.exec = ''
    git diff --staged
  '';
  scripts.gds.description = '' Runs git diff --staged '';

  enterShell = ''
    echo
    echo Nix devenv shell for Dynamic-TDD-Reinforcer
    echo To add python modules use 'poetry add'
    echo
  '';

  pre-commit.hooks.black.enable = true;
}

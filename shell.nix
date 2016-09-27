{ pkgs ? import <nixpkgs> {} }:
pkgs.callPackage ./default.nix {
  inherit (pkgs) stdenv;
  inherit (pkgs.python27Packages) buildPythonApplication pip;
}

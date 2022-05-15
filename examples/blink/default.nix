{ board, pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ../../arduino.nix { } {
  name = "blink";
  board = board;
  libraries = [];
  src = pkgs.lib.cleanSource ./.;
}

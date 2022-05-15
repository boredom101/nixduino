{ board, pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ../../arduino.nix { } {
  name = "sweep";
  board = board;
  libraries = ["Servo"];
  src = pkgs.lib.cleanSource ./.;
}

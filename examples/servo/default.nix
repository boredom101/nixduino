{ board, pkgs ? import <nixpkgs> {} }:

import ../../arduino.nix { inherit (pkgs) stdenv lib arduino-mk writeScript arduino-core; } {
  name = "sweep";
  board = board;
  libraries = ["Servo"];
  src = pkgs.lib.cleanSource ./.;
}

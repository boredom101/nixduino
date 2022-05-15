{ board, pkgs ? import <nixpkgs> {} }:

import ../../arduino.nix { inherit (pkgs) stdenv lib arduino-mk writeScript arduino-core-unwrapped; } {
  name = "sweep";
  board = board;
  libraries = ["Servo"];
  src = pkgs.lib.cleanSource ./.;
}

{ board, pkgs ? import <nixpkgs> {} }:

import ../../arduino.nix { inherit (pkgs) stdenv lib arduino-mk writeScript arduino-core-unwrapped; } {
  name = "blink";
  board = board;
  libraries = [];
  src = pkgs.lib.cleanSource ./.;
}

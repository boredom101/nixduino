{ board, pkgs ? import <nixpkgs> {} }:

import ../../arduino.nix { inherit (pkgs) stdenv lib arduino-mk writeScript arduino-core; } {
  name = "blink";
  board = board;
  libraries = [];
  src = pkgs.lib.cleanSource ./.;
}

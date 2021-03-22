{ board, pkgs ? import <nixpkgs> {} }:

import ../arduino.nix { inherit (pkgs) stdenv lib arduino-mk writeScript; } {
  name = "blink";
  board = board;
  libraries = [];
  src = ./.;
}

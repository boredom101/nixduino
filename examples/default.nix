{ board, pkgs ? import <nixpkgs> {} }:

import ../arduino.nix { inherit (pkgs) stdenv lib android-mk; } {
  name = "blink";
  board = board;
  libraries = [];
  src = ./.;
}

{ board, pkgs ? import <nixpkgs> {} }:

import ../android.nix { inherit (pkgs) stdenv lib android-mk } {
  name = "blink";
  board = board;
  libraries = [];
  src = ./.;
}

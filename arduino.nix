{ lib, stdenv, writeScript, arduino-mk }:

{ name, board, libraries, ... }@args:

let
  extraArgs = removeAttrs args [ "name" "board" "libraries" ];
in stdenv.mkDerivation({
  buildInputs = [ arduino-mk ];
  makefile = (writeScript "makefile" ''
    BOARD_TAG = ${board}
    ARDUINO_LIBS = ${lib.concatStringsSep " " libraries}
    include ${arduino-mk}/Arduino.mk
  '').outPath;
  installPhase = ''
    mkdir -p $out
    mv build-${board}/$(basename $PWD).hex $out/build.hex
  '';
  name = "${name}-${board}";
} // extraArgs)

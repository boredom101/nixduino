{ lib, stdenv, writeScript, arduino-mk, arduino-core }:

{ name, board, libraries, ... }@args:

let
  extraArgs = removeAttrs args [ "name" "board" "libraries" ];
in stdenv.mkDerivation({
  buildInputs = [ arduino-mk arduino-core ];
  makefile = (writeScript "makefile" ''
    ARDUINO_DIR = ${arduino-core}/share/arduino
    BOARD_TAG = ${board}
    ARDUINO_LIBS = ${lib.concatStringsSep " " libraries}
    include ${arduino-mk}/Arduino.mk
  '').outPath;
  installPhase = ''
    mkdir -p $out
    mv build-${board}/$(basename $PWD)_.hex $out/build.hex
  '';
  name = "${name}-${board}";
} // extraArgs)

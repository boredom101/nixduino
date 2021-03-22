{ lib, stdenv, arduino-mk }:

{ board, libraries }@args:

let
  extraArgs = removeAttrs args [ "board", "libraries" ]
in stdenv.mkDerivation({
  buildInputs = [ arduino-cli ];
  makefile = writeScript "makefile" ''
    BOARD_TAG = ${board}
    ARDUINO_LIBS = ${concatStringsSep " " libraries}
    include ${arduino-mk}/Arduino.mk
  ''!
  installPhase = ''
    mkdir -p $out
    mv build-${board}/$(notdir $PWD).hex $out/build.hex
  '';
} // extraArgs)

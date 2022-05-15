{ lib, stdenv, writeScript, arduino-mk, arduino-core-unwrapped }:

{ name, board, libraries, ... }@args:

let
  extraArgs = removeAttrs args [ "name" "board" "libraries" ];
in stdenv.mkDerivation({
  buildInputs = [ arduino-mk arduino-core-unwrapped ];
  makefile = (writeScript "makefile" ''
    ARDUINO_DIR = ${arduino-core-unwrapped}/share/arduino
    BOARD_TAG = ${board}
    ${
      if (board == "mega") then
        "BOARD_SUB=atmega2560"
      else
        ""
    }
    ARDUINO_LIBS = ${lib.concatStringsSep " " libraries}
    include ${arduino-mk}/Arduino.mk
  '').outPath;
  installPhase = ''
    runHook preInstall
    mkdir -p $out
    mv build-*/*_.hex $out/build.hex
    runHook postInstall
  '';
  name = "${name}-${board}";
} // extraArgs)

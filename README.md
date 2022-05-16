# nixduino
Build arduino sketches like any other nix derivation.
Look at `examples/` for how to use it.

## How to use:
Create a nix file that looks something like this:
```nix
{ board, pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ../../arduino.nix { } { # path to arduino.nix from this repository
  name = "blink"; # name you want for the derivation
  board = board; # board name, added to the name
  # in this case it is from the command line, but you can also set it here
  libraries = []; # libraries from arduino-core, valid names below
  src = pkgs.lib.cleanSource ./.; # path to the arduino files, passed to the derivation
}
```

Then run this: `nix-build path/to/file.nix --argstr board "uno"`
Or whatever the board is, valid options below. Note that we can do this because the nix file accepts it as an argument.

## Supported Board Values:
- `uno`
- `leonardo`
- `mega`

## Supported Library Values:
- `Ethernet`
- `EEPROM`
- `Firmata`
- `GSM`
- `LiquidCrystal`
- `SD`
- `Servo`
- `SPI`
- `SoftwareSerial`
- `Stepper`
- `TFT`
- `WiFi`
- `Wire`

## Notes:
This is a work in progress

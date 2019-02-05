# macOS cross compiler for Raspberry Pi (rpi)

last build ...

## ct-ng setup to compile RPi

- case sensitive volume needed for crosstool-ng
  -  `./case-sensitive-volume.sh`
- setup the crosstool-ng build environment for raspberry pi.
  -  `./crosstool-ng-setup.sh`
- ct-ng build
  -  `./ct-ng-build.sh`
- test compile example
  -  `./test-rpi-build.sh`

# macOS cross compiler for Raspberry Pi (rpi)

last build ...

## resources

- example configs
    -  https://medium.com/coinmonks/setup-gcc-8-1-cross-compiler-toolchain-for-raspberry-pi-3-on-macos-high-sierra-cb3fc8b6443e
    -  https://github.com/crosstool-ng/crosstool-ng/blob/master/samples/armv8-rpi3-linux-gnueabihf/crosstool.config
    -  https://www.jaredwolff.com/toolchains/#hide1
- older compiles
    - https://www.bootc.net/archives/2012/05/26/how-to-build-a-cross-compiler-for-your-raspberry-pi/
- arm tools
    -  https://developer.arm.com/open-source/gnu-toolchain/gnu-rm
    
## ct-ng setup to compile RPi

- case sensitive volume needed for crosstool-ng
  -  `./case-sensitive-volume.sh`
- setup the crosstool-ng build environment for raspberry pi.
  -  `./crosstool-ng-setup.sh`
- ct-ng build
  -  `./ct-ng-build.sh`
- test compile example
  -  `./rpi-test.sh`

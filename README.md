# TangNano9k Hello World
Simple `Hello World` project for the Sipeed `Tang Nano 9k` FPGA development board using the Gowin `GW1N-9C` FPGA.

For more read (Sipeed's wiki)[https://wiki.sipeed.com/hardware/en/tang/Tang-Nano-9K/Nano-9K.html] on the `Tang Nano 9k`

## Prerequisites
- Tang Nano 9k FPGA development board
- Working installation of (oss-cad-suite)[https://github.com/YosysHQ/oss-cad-suite-build]

## Use
To use this, simply plug-in your FPGA development and run the following commands via the `makefile`:
```
make synth
make pnr
make bitstream
make program
```

Do you hate typing? You can also use the `make all`:
```
make all
make program
```

If you want to start over, you can `clean`:
```
make clean
```

# Credit
Thanks to Lushylabs for making an excellent (tutorial)[https://learn.lushaylabs.com/getting-setup-with-the-tang-nano-9k/] upon which the RTL is based.

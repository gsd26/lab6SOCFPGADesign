# radio_periph_lab(Gautham)

Note : if you are building in windows and vivado is not installed in c:\Xilinx\Vivado\2021.2, you will have to change one thing
I included the settings64.bat file in the make_project.bat just to save a step.  Change that to your Install directory

run make_project.bat (windows) or make_project.sh (linux) to build the project all the way through SD card creation.  You can of course
edit in the GUI and debug in Vitis GUI afterwards as well.  The Vivado project is in "vivado" and the vitis workspace will be in "vitis"

Only downside of this (haven't fixed it yet) the C code for the processor is copied into the Vitis workspace, not linked from the original
version controlled SRC directory.  So, if you change it, you have to copy it back there.  There is a solution to this of course, but haven't 
done it yet

The base distributed project for the radio peripheral laboratory
## Register Description
### Register 0 (BASE+0x00): 
Timer Register: Free-Running 32 Bit Counter. Writing to this register resets the counter back to 0. Reading from this register gives you the current free running counter
### Register 1 (BASE+0x04): 
ADC Phase Increment. Writing to this sets the ADC Phase Increment. Reading from this returns the ADC Phase Increment. 
### Register 2 (BASE+0x08): 
Tuner Phase Increment. Writing to this sets the Tuner Phase Increment. Reading from this returns the Tuner Phase Increment. 
### Register 3 (BASE+0x12):
Sync Reset: Writing a 0 lets the module out of reset. Writing a 1(or higher) puts it in reset. 

## Serial Port Description
115200 Baud Rate, No Parity, Use External PMOD

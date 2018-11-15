# grinnell-211-datapath
Labwork for Grinnell College's Computer Organization &amp; Architecture Course (CSC 211): a working datapath and assembler for a simple architecture called PIPS. 

## Assembling Test Files
Run the following command in your in the programs directory of the project: `./asm programs/test_file_name.s` Notice that a correstponding test_file_name.s file must already exist in the programs directory.

The command should produce a similarly named hex file (ex: `test_file_name.hex`) to be loaded as an image into your datapath. 

## Running Assembled Test Files on Datapath

Open the `datapath.circ` file in [Logisim](http://www.cburch.com/logisim/).

In the main file of `datapath.circ`, load the `microprogram.hex` file as an image into the ROM element named *Microprogram ROM*. Also load the `test_file_name.hex` file as an image into the RAM element named *Instruction Memory*

Use `Ctrl+t` to "Tick" the clock. Notice that the program cycles through Instruction Memory as the clock ticks. Once there are no more non-zero instructions in Instruction Memory, check `register_file` for the program results.

Use `Ctrl+r` to reset the clock and the Instruction Memory. 

## Notes
Any test file that does not start with a `nop` is subject to variable behavior due to datapath configurations. 

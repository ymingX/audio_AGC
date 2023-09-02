#!/bin/sh
#
# This file was automatically generated.
#
# It can be overwritten by nios2-flash-programmer-generate or nios2-flash-programmer-gui.
#

#
# Converting SOF File: E:\Work\01_Program\Quartus\FFT_end\newlcd1_1.0_menu\output_files\lemon.sof to: "..\flash/lemon_generic_tristate_controller.flash"
#
sof2flash --input="E:/Work/01_Program/Quartus/FFT_end/newlcd1_1.0_menu/output_files/lemon.sof" --output="../flash/lemon_generic_tristate_controller.flash" --offset=0x0 --verbose 

#
# Programming File: "..\flash/lemon_generic_tristate_controller.flash" To Device: generic_tristate_controller
#
nios2-flash-programmer "../flash/lemon_generic_tristate_controller.flash" --base=0x0 --sidp=0x401120 --id=0x0 --timestamp=1561428679 --device=1 --instance=0 '--cable=USB-Blaster on localhost [USB-0]' --program --verbose 

#
# Converting ELF File: E:\Work\01_Program\Quartus\FFT_end\newlcd1_1.0_menu\software\helloagain\helloagain.elf to: "..\flash/helloagain_generic_tristate_controller.flash"
#
elf2flash --input="E:/Work/01_Program/Quartus/FFT_end/newlcd1_1.0_menu/software/helloagain/helloagain.elf" --output="../flash/helloagain_generic_tristate_controller.flash" --boot="$SOPC_KIT_NIOS2/components/altera_nios2/boot_loader_cfi.srec" --base=0x0 --end=0x400000 --reset=0x0 --verbose 

#
# Programming File: "..\flash/helloagain_generic_tristate_controller.flash" To Device: generic_tristate_controller
#
nios2-flash-programmer "../flash/helloagain_generic_tristate_controller.flash" --base=0x0 --sidp=0x401120 --id=0x0 --timestamp=1561428679 --device=1 --instance=0 '--cable=USB-Blaster on localhost [USB-0]' --program --verbose 


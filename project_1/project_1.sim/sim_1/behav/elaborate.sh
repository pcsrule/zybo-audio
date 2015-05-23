#!/bin/sh -f
xv_path="/home/nolan/apps/xilinx/Vivado/2015.1"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto e8a8c07d4b4e40dfaf9741f616e5785c -m64 --debug typical --relax --mt 8 --include "../../../project_1.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot i2c_test_behav xil_defaultlib.i2c_test xil_defaultlib.glbl -log elaborate.log

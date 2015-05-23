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
ExecStep $xv_path/bin/xsim i2c_test_behav -key {Behavioral:sim_1:Functional:i2c_test} -tclbatch i2c_test.tcl -log simulate.log

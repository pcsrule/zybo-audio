
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z010clg400-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set IIC_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC_0 ]

  # Create ports
  set AC_BCLK [ create_bd_port -dir O AC_BCLK ]
  set AC_MCLK [ create_bd_port -dir O AC_MCLK ]
  set AC_MUTEN [ create_bd_port -dir O AC_MUTEN ]
  set AC_PBDAT [ create_bd_port -dir O AC_PBDAT ]
  set AC_PBLRC [ create_bd_port -dir O AC_PBLRC ]
  set AC_RECDAT [ create_bd_port -dir I AC_RECDAT ]
  set AC_RECLRC [ create_bd_port -dir O AC_RECLRC ]
  set button [ create_bd_port -dir I button ]
  set led_tri_o [ create_bd_port -dir O -from 3 -to 0 led_tri_o ]

  # Create instance: ac_interface_0, and set properties
  set ac_interface_0 [ create_bd_cell -type ip -vlnv Nolan:user:ac_interface:1.1 ac_interface_0 ]

  # Create instance: fifo_generator_1, and set properties
  set fifo_generator_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.0 fifo_generator_1 ]
  set_property -dict [ list \
CONFIG.Data_Count_Width {13} \
CONFIG.Full_Threshold_Assert_Value {8190} \
CONFIG.Full_Threshold_Negate_Value {8189} \
CONFIG.Input_Data_Width {32} \
CONFIG.Input_Depth {8192} \
CONFIG.Output_Data_Width {32} \
CONFIG.Output_Depth {8192} \
CONFIG.Read_Data_Count_Width {13} \
CONFIG.Write_Data_Count_Width {13} \
 ] $fifo_generator_1

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_EN_CLK0_PORT {1} \
CONFIG.PCW_EN_CLK2_PORT {1} \
CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
CONFIG.PCW_I2C0_GRP_INT_ENABLE {1} \
CONFIG.PCW_I2C0_GRP_INT_IO {EMIO} \
CONFIG.PCW_I2C0_I2C0_IO {EMIO} \
CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_IMPORT_BOARD_PRESET {/home/nolan/Downloads/ZYBO_zynq_def.xml} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
CONFIG.PCW_SD0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_UART0_UART0_IO {<Select>} \
CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_USB0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_USE_M_AXI_GP0 {1} \
CONFIG.PCW_WDT_PERIPHERAL_ENABLE {1} \
 ] $processing_system7_0

  # Create instance: processing_system7_0_axi_periph, and set properties
  set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 processing_system7_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {2} \
 ] $processing_system7_0_axi_periph

  # Create instance: rst_processing_system7_0_100M, and set properties
  set rst_processing_system7_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_100M ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_IIC_0 [get_bd_intf_ports IIC_0] [get_bd_intf_pins processing_system7_0/IIC_0]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]

  # Create port connections
  connect_bd_net -net AC_RECDAT_1 [get_bd_ports AC_RECDAT] [get_bd_pins ac_interface_0/AC_RECDAT]
  connect_bd_net -net ac_interface_0_AC_BCLK [get_bd_ports AC_BCLK] [get_bd_pins ac_interface_0/AC_BCLK]
  connect_bd_net -net ac_interface_0_AC_MUTEN [get_bd_ports AC_MUTEN] [get_bd_pins ac_interface_0/AC_MUTEN]
  connect_bd_net -net ac_interface_0_AC_PBDAT [get_bd_ports AC_PBDAT] [get_bd_pins ac_interface_0/AC_PBDAT]
  connect_bd_net -net ac_interface_0_AC_RECLRC [get_bd_ports AC_PBLRC] [get_bd_ports AC_RECLRC] [get_bd_pins ac_interface_0/AC_LRCLK]
  connect_bd_net -net ac_interface_0_frame_sync [get_bd_pins ac_interface_0/frame_sync] [get_bd_pins fifo_generator_1/clk]
  connect_bd_net -net ac_interface_0_led [get_bd_ports led_tri_o] [get_bd_pins ac_interface_0/led]
  connect_bd_net -net ac_interface_0_rec_parallel [get_bd_pins ac_interface_0/rec_parallel] [get_bd_pins fifo_generator_1/din]
  connect_bd_net -net button_1 [get_bd_ports button] [get_bd_pins fifo_generator_1/srst]
  connect_bd_net -net fifo_generator_1_dout [get_bd_pins ac_interface_0/play_parallel] [get_bd_pins fifo_generator_1/dout]
  connect_bd_net -net fifo_generator_1_full [get_bd_pins fifo_generator_1/full] [get_bd_pins fifo_generator_1/rd_en]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/M01_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK] [get_bd_pins rst_processing_system7_0_100M/slowest_sync_clk]
  connect_bd_net -net processing_system7_0_FCLK_CLK2 [get_bd_ports AC_MCLK] [get_bd_pins ac_interface_0/mclk] [get_bd_pins processing_system7_0/FCLK_CLK2]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins ac_interface_0/reset] [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_100M/ext_reset_in]
  connect_bd_net -net rst_processing_system7_0_100M_interconnect_aresetn [get_bd_pins processing_system7_0_axi_periph/ARESETN] [get_bd_pins rst_processing_system7_0_100M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M01_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_processing_system7_0_100M/peripheral_aresetn]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins fifo_generator_1/wr_en] [get_bd_pins xlconstant_0/dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.8
#  -string -flagsOSRD
preplace port AC_RECLRC -pg 1 -y 650 -defaultsOSRD
preplace port DDR -pg 1 -y 270 -defaultsOSRD
preplace port AC_MCLK -pg 1 -y 330 -defaultsOSRD
preplace port button -pg 1 -y 590 -defaultsOSRD -right
preplace port AC_MUTEN -pg 1 -y 690 -defaultsOSRD
preplace port AC_RECDAT -pg 1 -y 780 -defaultsOSRD -right
preplace port AC_PBLRC -pg 1 -y 630 -defaultsOSRD
preplace port IIC_0 -pg 1 -y 310 -defaultsOSRD
preplace port FIXED_IO -pg 1 -y 290 -defaultsOSRD
preplace port AC_BCLK -pg 1 -y 610 -defaultsOSRD
preplace port AC_PBDAT -pg 1 -y 670 -defaultsOSRD
preplace portBus led_tri_o -pg 1 -y 730 -defaultsOSRD
preplace inst ac_interface_0 -pg 1 -lvl 1 -y 670 -defaultsOSRD
preplace inst rst_processing_system7_0_100M -pg 1 -lvl 1 -y 140 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 1 -y 830 -defaultsOSRD
preplace inst fifo_generator_1 -pg 1 -lvl 2 -y 470 -defaultsOSRD
preplace inst processing_system7_0_axi_periph -pg 1 -lvl 2 -y 130 -defaultsOSRD
preplace inst processing_system7_0 -pg 1 -lvl 1 -y 370 -defaultsOSRD
preplace netloc processing_system7_0_DDR 1 1 2 NJ 270 NJ
preplace netloc ac_interface_0_rec_parallel 1 1 1 460
preplace netloc fifo_generator_1_full 1 1 1 490
preplace netloc ac_interface_0_AC_RECLRC 1 1 2 NJ 640 NJ
preplace netloc processing_system7_0_M_AXI_GP0 1 1 1 460
preplace netloc processing_system7_0_FCLK_RESET0_N 1 0 2 10 520 440
preplace netloc processing_system7_0_IIC_0 1 1 2 NJ 310 NJ
preplace netloc ac_interface_0_led 1 1 2 NJ 730 NJ
preplace netloc rst_processing_system7_0_100M_peripheral_aresetn 1 1 1 490
preplace netloc xlconstant_0_dout 1 1 1 NJ
preplace netloc AC_RECDAT_1 1 0 3 30 780 NJ 780 NJ
preplace netloc processing_system7_0_FIXED_IO 1 1 2 NJ 290 NJ
preplace netloc ac_interface_0_AC_PBDAT 1 1 2 NJ 670 NJ
preplace netloc ac_interface_0_frame_sync 1 1 1 490
preplace netloc fifo_generator_1_dout 1 0 2 20 530 NJ
preplace netloc ac_interface_0_AC_BCLK 1 1 2 NJ 610 NJ
preplace netloc rst_processing_system7_0_100M_interconnect_aresetn 1 1 1 480
preplace netloc processing_system7_0_FCLK_CLK0 1 0 2 40 50 440
preplace netloc button_1 1 1 2 500 620 NJ
preplace netloc ac_interface_0_AC_MUTEN 1 1 2 NJ 690 NJ
preplace netloc processing_system7_0_FCLK_CLK2 1 0 3 40 560 450 630 NJ
levelinfo -pg 1 -10 240 660 840 -top 0 -bot 890
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""



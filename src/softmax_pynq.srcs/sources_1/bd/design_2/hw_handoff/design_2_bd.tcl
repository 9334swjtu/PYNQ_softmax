
################################################################
# This is a generated script based on design: design_2
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_2_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# fix_shift, myrom4bit, myrom4bit, myrom4bit, myrom4bit, myrom5bit, myslice, myslice, myslice, myslice, not_gate, reg5, reg5, summary

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg484-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_2

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

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set P_0 [ create_bd_port -dir O -from 31 -to 0 -type data P_0 ]
  set clk_0 [ create_bd_port -dir I -type clk clk_0 ]
  set en_0 [ create_bd_port -dir I en_0 ]
  set fix_num_0 [ create_bd_port -dir I -from 15 -to 0 fix_num_0 ]
  set point_position_0 [ create_bd_port -dir I -from 2 -to 0 point_position_0 ]
  set rst_n_0 [ create_bd_port -dir I -type rst rst_n_0 ]
  set sum_0 [ create_bd_port -dir O -from 63 -to 0 sum_0 ]

  # Create instance: fix_shift_0, and set properties
  set block_name fix_shift
  set block_cell_name fix_shift_0
  if { [catch {set fix_shift_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $fix_shift_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: multiply32_32_0, and set properties
  set multiply32_32_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:multiply32_32:1.0 multiply32_32_0 ]

  # Create instance: multiply32_32_1, and set properties
  set multiply32_32_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:multiply32_32:1.0 multiply32_32_1 ]

  # Create instance: multiply32_32_2, and set properties
  set multiply32_32_2 [ create_bd_cell -type ip -vlnv xilinx.com:user:multiply32_32:1.0 multiply32_32_2 ]

  # Create instance: multiply32_32_3, and set properties
  set multiply32_32_3 [ create_bd_cell -type ip -vlnv xilinx.com:user:multiply32_32:1.0 multiply32_32_3 ]

  # Create instance: myrom4bit_4, and set properties
  set block_name myrom4bit
  set block_cell_name myrom4bit_4
  if { [catch {set myrom4bit_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $myrom4bit_4 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.RESULT_00 {0x80000000} \
   CONFIG.RESULT_01 {0x783eafef} \
   CONFIG.RESULT_02 {0x70f5a893} \
   CONFIG.RESULT_03 {0x6a1da04b} \
   CONFIG.RESULT_04 {0x63afbe7a} \
   CONFIG.RESULT_05 {0x5da594b7} \
   CONFIG.RESULT_06 {0x57f91857} \
   CONFIG.RESULT_07 {0x52a49c64} \
   CONFIG.RESULT_08 {0x4da2cbf1} \
   CONFIG.RESULT_09 {0x48eea4c3} \
   CONFIG.RESULT_10 {0x4483724d} \
   CONFIG.RESULT_11 {0x405cc8ff} \
   CONFIG.RESULT_12 {0x3c7681d7} \
   CONFIG.RESULT_13 {0x38ccb63c} \
   CONFIG.RESULT_14 {0x355bbc12} \
   CONFIG.RESULT_15 {0x32202217} \
 ] $myrom4bit_4

  # Create instance: myrom4bit_5, and set properties
  set block_name myrom4bit
  set block_cell_name myrom4bit_5
  if { [catch {set myrom4bit_5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $myrom4bit_5 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.RESULT_00 {0x80000000} \
   CONFIG.RESULT_01 {0x7f803fea} \
   CONFIG.RESULT_02 {0x7f00ff55} \
   CONFIG.RESULT_03 {0x7e823dc1} \
   CONFIG.RESULT_04 {0x7e03faaf} \
   CONFIG.RESULT_05 {0x7d8635a2} \
   CONFIG.RESULT_06 {0x7d08ee1a} \
   CONFIG.RESULT_07 {0x7c8c239c} \
   CONFIG.RESULT_08 {0x7c0fd5aa} \
   CONFIG.RESULT_09 {0x7b9403c7} \
   CONFIG.RESULT_10 {0x7b18ad79} \
   CONFIG.RESULT_11 {0x7a9dd243} \
   CONFIG.RESULT_12 {0x7a2371ab} \
   CONFIG.RESULT_13 {0x79a98b37} \
   CONFIG.RESULT_14 {0x79301e6c} \
   CONFIG.RESULT_15 {0x78b72ad2} \
 ] $myrom4bit_5

  # Create instance: myrom4bit_6, and set properties
  set block_name myrom4bit
  set block_cell_name myrom4bit_6
  if { [catch {set myrom4bit_6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $myrom4bit_6 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.RESULT_00 {0x80000000} \
   CONFIG.RESULT_01 {0x7ff8003f} \
   CONFIG.RESULT_02 {0x7ff000ff} \
   CONFIG.RESULT_03 {0x7fe8023f} \
   CONFIG.RESULT_04 {0x7fe003ff} \
   CONFIG.RESULT_05 {0x7fd8063f} \
   CONFIG.RESULT_06 {0x7fd008fe} \
   CONFIG.RESULT_07 {0x7fc80c3e} \
   CONFIG.RESULT_08 {0x7fc00ffd} \
   CONFIG.RESULT_09 {0x7fb8143c} \
   CONFIG.RESULT_10 {0x7fb018fa} \
   CONFIG.RESULT_11 {0x7fa81e39} \
   CONFIG.RESULT_12 {0x7fa023f7} \
   CONFIG.RESULT_13 {0x7f982a34} \
   CONFIG.RESULT_14 {0x7f9030f1} \
   CONFIG.RESULT_15 {0x7f88382e} \
 ] $myrom4bit_6

  # Create instance: myrom4bit_7, and set properties
  set block_name myrom4bit
  set block_cell_name myrom4bit_7
  if { [catch {set myrom4bit_7 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $myrom4bit_7 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.RESULT_00 {0x80000000} \
   CONFIG.RESULT_01 {0x7fff8000} \
   CONFIG.RESULT_02 {0x7fff0000} \
   CONFIG.RESULT_03 {0x7ffe8002} \
   CONFIG.RESULT_04 {0x7ffe0003} \
   CONFIG.RESULT_05 {0x7ffd8006} \
   CONFIG.RESULT_06 {0x7ffd0008} \
   CONFIG.RESULT_07 {0x7ffc800c} \
   CONFIG.RESULT_08 {0x7ffc000f} \
   CONFIG.RESULT_09 {0x7ffb8014} \
   CONFIG.RESULT_10 {0x7ffb0018} \
   CONFIG.RESULT_11 {0x7ffa801e} \
   CONFIG.RESULT_12 {0x7ffa0023} \
   CONFIG.RESULT_13 {0x7ff9802a} \
   CONFIG.RESULT_14 {0x7ff90030} \
   CONFIG.RESULT_15 {0x7ff88038} \
 ] $myrom4bit_7

  # Create instance: myrom5bit_1, and set properties
  set block_name myrom5bit
  set block_cell_name myrom5bit_1
  if { [catch {set myrom5bit_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $myrom5bit_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.RESULT_00 {0x80000000} \
   CONFIG.RESULT_01 {0x2f16ac6c} \
   CONFIG.RESULT_02 {0x1152aaa3} \
   CONFIG.RESULT_03 {0x065F6C33} \
   CONFIG.RESULT_04 {0x02582AB7} \
   CONFIG.RESULT_05 {0x00DCC9FF} \
   CONFIG.RESULT_06 {0x00513947} \
   CONFIG.RESULT_07 {0x001DE16B} \
   CONFIG.RESULT_08 {0x000AFE10} \
   CONFIG.RESULT_09 {0x00040B3C} \
   CONFIG.RESULT_10 {0x00017CD7} \
   CONFIG.RESULT_11 {0x00008C1A} \
   CONFIG.RESULT_12 {0x0000338A} \
   CONFIG.RESULT_13 {0x000012F6} \
   CONFIG.RESULT_14 {0x000006F9} \
   CONFIG.RESULT_15 {0x00000290} \
   CONFIG.RESULT_16 {0x000000F1} \
   CONFIG.RESULT_17 {0x00000058} \
   CONFIG.RESULT_18 {0x00000020} \
   CONFIG.RESULT_19 {0x0000000C} \
   CONFIG.RESULT_20 {0x00000004} \
   CONFIG.RESULT_21 {0x00000001} \
   CONFIG.RESULT_22 {0x00000000} \
   CONFIG.RESULT_23 {0x00000000} \
   CONFIG.RESULT_24 {0x00000000} \
   CONFIG.RESULT_25 {0x00000000} \
   CONFIG.RESULT_26 {0x00000000} \
   CONFIG.RESULT_27 {0x00000000} \
   CONFIG.RESULT_28 {0x00000000} \
   CONFIG.RESULT_29 {0x00000000} \
   CONFIG.RESULT_30 {0x00000000} \
   CONFIG.RESULT_31 {0x00000000} \
 ] $myrom5bit_1

  # Create instance: myslice_0, and set properties
  set block_name myslice
  set block_cell_name myslice_0
  if { [catch {set myslice_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $myslice_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.IN_BITS {63} \
   CONFIG.OUT_BITS {31} \
   CONFIG.SLICE_BIT_HIGH {63} \
   CONFIG.SLICE_BIT_LOW {32} \
 ] $myslice_0

  # Create instance: myslice_1, and set properties
  set block_name myslice
  set block_cell_name myslice_1
  if { [catch {set myslice_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $myslice_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.IN_BITS {63} \
   CONFIG.OUT_BITS {31} \
   CONFIG.SLICE_BIT_HIGH {63} \
   CONFIG.SLICE_BIT_LOW {32} \
 ] $myslice_1

  # Create instance: myslice_2, and set properties
  set block_name myslice
  set block_cell_name myslice_2
  if { [catch {set myslice_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $myslice_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.IN_BITS {63} \
   CONFIG.OUT_BITS {31} \
   CONFIG.SLICE_BIT_HIGH {63} \
   CONFIG.SLICE_BIT_LOW {32} \
 ] $myslice_2

  # Create instance: myslice_3, and set properties
  set block_name myslice
  set block_cell_name myslice_3
  if { [catch {set myslice_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $myslice_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.IN_BITS {63} \
   CONFIG.OUT_BITS {31} \
   CONFIG.SLICE_BIT_HIGH {63} \
   CONFIG.SLICE_BIT_LOW {32} \
 ] $myslice_3

  # Create instance: not_gate_0, and set properties
  set block_name not_gate
  set block_cell_name not_gate_0
  if { [catch {set not_gate_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $not_gate_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: reg5_0, and set properties
  set block_name reg5
  set block_cell_name reg5_0
  if { [catch {set reg5_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $reg5_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.BITS {31} \
 ] $reg5_0

  # Create instance: reg5_1, and set properties
  set block_name reg5
  set block_cell_name reg5_1
  if { [catch {set reg5_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $reg5_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.BITS {31} \
 ] $reg5_1

  # Create instance: summary_0, and set properties
  set block_name summary
  set block_cell_name summary_0
  if { [catch {set summary_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $summary_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.IN0_WIDTH {16} \
   CONFIG.IN1_WIDTH {13} \
   CONFIG.IN2_WIDTH {3} \
   CONFIG.NUM_PORTS {3} \
 ] $xlconcat_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {13} \
 ] $xlconstant_0

  # Create port connections
  connect_bd_net -net clk_0_1 [get_bd_ports clk_0] [get_bd_pins fix_shift_0/clk] [get_bd_pins multiply32_32_0/clk] [get_bd_pins multiply32_32_1/clk] [get_bd_pins multiply32_32_2/clk] [get_bd_pins multiply32_32_3/clk] [get_bd_pins myrom4bit_4/clk] [get_bd_pins myrom4bit_5/clk] [get_bd_pins myrom4bit_6/clk] [get_bd_pins myrom4bit_7/clk] [get_bd_pins myrom5bit_1/clk] [get_bd_pins reg5_0/clk] [get_bd_pins reg5_1/clk] [get_bd_pins summary_0/clk]
  connect_bd_net -net en_0_1 [get_bd_ports en_0] [get_bd_pins summary_0/en]
  connect_bd_net -net fix_num_0_1 [get_bd_ports fix_num_0] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net fix_shift_0_after_point_0 [get_bd_pins fix_shift_0/after_point_0] [get_bd_pins myrom4bit_4/cur_substrate_N]
  connect_bd_net -net fix_shift_0_after_point_1 [get_bd_pins fix_shift_0/after_point_1] [get_bd_pins myrom4bit_5/cur_substrate_N]
  connect_bd_net -net fix_shift_0_after_point_2 [get_bd_pins fix_shift_0/after_point_2] [get_bd_pins myrom4bit_6/cur_substrate_N]
  connect_bd_net -net fix_shift_0_after_point_3 [get_bd_pins fix_shift_0/after_point_3] [get_bd_pins myrom4bit_7/cur_substrate_N]
  connect_bd_net -net fix_shift_0_befor_point [get_bd_pins fix_shift_0/befor_point] [get_bd_pins myrom5bit_1/cur_substrate_N]
  connect_bd_net -net mult_gen_0_P [get_bd_ports P_0] [get_bd_pins myslice_3/dout] [get_bd_pins summary_0/data_in]
  connect_bd_net -net multiply32_32_0_outdata [get_bd_pins multiply32_32_0/outdata] [get_bd_pins myslice_0/din]
  connect_bd_net -net multiply32_32_1_outdata [get_bd_pins multiply32_32_1/outdata] [get_bd_pins myslice_1/din]
  connect_bd_net -net multiply32_32_2_outdata [get_bd_pins multiply32_32_2/outdata] [get_bd_pins myslice_3/din]
  connect_bd_net -net multiply32_32_3_outdata [get_bd_pins multiply32_32_3/outdata] [get_bd_pins myslice_2/din]
  connect_bd_net -net myrom4bit_4_cur_result [get_bd_pins multiply32_32_0/dataA] [get_bd_pins myrom4bit_4/cur_result]
  connect_bd_net -net myrom4bit_5_cur_result [get_bd_pins multiply32_32_0/dataB] [get_bd_pins myrom4bit_5/cur_result]
  connect_bd_net -net myrom4bit_6_cur_result [get_bd_pins multiply32_32_1/dataA] [get_bd_pins myrom4bit_6/cur_result]
  connect_bd_net -net myrom4bit_7_cur_result [get_bd_pins multiply32_32_1/dataB] [get_bd_pins myrom4bit_7/cur_result]
  connect_bd_net -net myrom5bit_1_cur_result [get_bd_pins myrom5bit_1/cur_result] [get_bd_pins reg5_0/din]
  connect_bd_net -net myslice_0_dout [get_bd_pins multiply32_32_3/dataA] [get_bd_pins myslice_0/dout]
  connect_bd_net -net myslice_1_dout [get_bd_pins multiply32_32_3/dataB] [get_bd_pins myslice_1/dout]
  connect_bd_net -net myslice_2_dout [get_bd_pins multiply32_32_2/dataA] [get_bd_pins myslice_2/dout]
  connect_bd_net -net not_gate_0_b [get_bd_pins multiply32_32_0/rst] [get_bd_pins multiply32_32_1/rst] [get_bd_pins multiply32_32_2/rst] [get_bd_pins multiply32_32_3/rst] [get_bd_pins not_gate_0/b]
  connect_bd_net -net point_position_0_1 [get_bd_ports point_position_0] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net reg5_0_dout [get_bd_pins reg5_0/dout] [get_bd_pins reg5_1/din]
  connect_bd_net -net reg5_1_dout [get_bd_pins multiply32_32_2/dataB] [get_bd_pins reg5_1/dout]
  connect_bd_net -net rst_n_0_1 [get_bd_ports rst_n_0] [get_bd_pins fix_shift_0/rst] [get_bd_pins myrom4bit_4/rst_n] [get_bd_pins myrom4bit_5/rst_n] [get_bd_pins myrom4bit_6/rst_n] [get_bd_pins myrom4bit_7/rst_n] [get_bd_pins myrom5bit_1/rst_n] [get_bd_pins not_gate_0/a] [get_bd_pins reg5_0/rst] [get_bd_pins reg5_1/rst] [get_bd_pins summary_0/rst]
  connect_bd_net -net summary_0_sum [get_bd_ports sum_0] [get_bd_pins summary_0/sum]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins fix_shift_0/input_data] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconcat_0/In1] [get_bd_pins xlconstant_0/dout]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""



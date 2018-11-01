
################################################################
# This is a generated script based on design: design_1
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
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# button_single, custom_register, custom_register, custom_register, custom_register, custom_register, div_part_clk_control, fix_shift, myrom4bit, myrom4bit, myrom4bit, myrom4bit, myrom5bit, myslice, myslice, myslice, myslice, myslice, new_axi_m, reg3, reg3, reg4, reg4, reg62, reg64, shift_r2, switch_16_8, w1_combine, w2_combine

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-1
   set_property BOARD_PART www.digilentinc.com:pynq-z1:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
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
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

  # Create ports
  set btn_switch_state_0 [ create_bd_port -dir I btn_switch_state_0 ]
  set led [ create_bd_port -dir O -from 1 -to 0 led ]

  # Create instance: DIV40_32_TOP_0, and set properties
  set DIV40_32_TOP_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:DIV40_32_TOP:1.0 DIV40_32_TOP_0 ]

  # Create instance: MUL_TOP_0, and set properties
  set MUL_TOP_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:MUL_TOP:1.0 MUL_TOP_0 ]

  # Create instance: MUL_TOP_1, and set properties
  set MUL_TOP_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:MUL_TOP:1.0 MUL_TOP_1 ]

  # Create instance: MUL_TOP_2, and set properties
  set MUL_TOP_2 [ create_bd_cell -type ip -vlnv xilinx.com:user:MUL_TOP:1.0 MUL_TOP_2 ]

  # Create instance: MUL_TOP_3, and set properties
  set MUL_TOP_3 [ create_bd_cell -type ip -vlnv xilinx.com:user:MUL_TOP:1.0 MUL_TOP_3 ]

  # Create instance: axi_s_control_0, and set properties
  set axi_s_control_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:axi_s_control:1.0 axi_s_control_0 ]

  set_property -dict [ list \
   CONFIG.NUM_READ_OUTSTANDING {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {1} \
 ] [get_bd_intf_pins /axi_s_control_0/S_AXI]

  # Create instance: button_single_0, and set properties
  set block_name button_single
  set block_cell_name button_single_0
  if { [catch {set button_single_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $button_single_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: custom_register_0, and set properties
  set block_name custom_register
  set block_cell_name custom_register_0
  if { [catch {set custom_register_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $custom_register_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.bits {0} \
 ] $custom_register_0

  # Create instance: custom_register_4, and set properties
  set block_name custom_register
  set block_cell_name custom_register_4
  if { [catch {set custom_register_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $custom_register_4 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.bits {0} \
 ] $custom_register_4

  # Create instance: custom_register_5, and set properties
  set block_name custom_register
  set block_cell_name custom_register_5
  if { [catch {set custom_register_5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $custom_register_5 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.bits {0} \
 ] $custom_register_5

  # Create instance: custom_register_6, and set properties
  set block_name custom_register
  set block_cell_name custom_register_6
  if { [catch {set custom_register_6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $custom_register_6 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.bits {0} \
 ] $custom_register_6

  # Create instance: custom_register_7, and set properties
  set block_name custom_register
  set block_cell_name custom_register_7
  if { [catch {set custom_register_7 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $custom_register_7 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.bits {15} \
 ] $custom_register_7

  # Create instance: div_part_clk_control_0, and set properties
  set block_name div_part_clk_control
  set block_cell_name div_part_clk_control_0
  if { [catch {set div_part_clk_control_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $div_part_clk_control_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
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
   CONFIG.RESULT_00 {0x8000} \
   CONFIG.RESULT_01 {0x783E} \
   CONFIG.RESULT_02 {0x70F5} \
   CONFIG.RESULT_03 {0x6A1D} \
   CONFIG.RESULT_04 {0x63AF} \
   CONFIG.RESULT_05 {0x5DA5} \
   CONFIG.RESULT_06 {0x57F9} \
   CONFIG.RESULT_07 {0x52A4} \
   CONFIG.RESULT_08 {0x4DA2} \
   CONFIG.RESULT_09 {0x48EE} \
   CONFIG.RESULT_10 {0x4483} \
   CONFIG.RESULT_11 {0x405C} \
   CONFIG.RESULT_12 {0x3C76} \
   CONFIG.RESULT_13 {0x38CC} \
   CONFIG.RESULT_14 {0x355B} \
   CONFIG.RESULT_15 {0x3220} \
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
   CONFIG.RESULT_00 {0x8000} \
   CONFIG.RESULT_01 {0x7F80} \
   CONFIG.RESULT_02 {0x7F00} \
   CONFIG.RESULT_03 {0x7E82} \
   CONFIG.RESULT_04 {0x7E03} \
   CONFIG.RESULT_05 {0x7D86} \
   CONFIG.RESULT_06 {0x7D08} \
   CONFIG.RESULT_07 {0x7C8C} \
   CONFIG.RESULT_08 {0x7C0F} \
   CONFIG.RESULT_09 {0x7B94} \
   CONFIG.RESULT_10 {0x7B18} \
   CONFIG.RESULT_11 {0x7A9D} \
   CONFIG.RESULT_12 {0x7A23} \
   CONFIG.RESULT_13 {0x79A9} \
   CONFIG.RESULT_14 {0x7930} \
   CONFIG.RESULT_15 {0x78B7} \
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
   CONFIG.RESULT_00 {0x8000} \
   CONFIG.RESULT_01 {0x7FF8} \
   CONFIG.RESULT_02 {0x7FF0} \
   CONFIG.RESULT_03 {0x7FE8} \
   CONFIG.RESULT_04 {0x7FE0} \
   CONFIG.RESULT_05 {0x7FD8} \
   CONFIG.RESULT_06 {0x7FD0} \
   CONFIG.RESULT_07 {0x7FC8} \
   CONFIG.RESULT_08 {0x7FC0} \
   CONFIG.RESULT_09 {0x7FB8} \
   CONFIG.RESULT_10 {0x7FB0} \
   CONFIG.RESULT_11 {0x7FA8} \
   CONFIG.RESULT_12 {0x7FA0} \
   CONFIG.RESULT_13 {0x7F98} \
   CONFIG.RESULT_14 {0x7F90} \
   CONFIG.RESULT_15 {0x7F88} \
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
   CONFIG.RESULT_00 {0x8000} \
   CONFIG.RESULT_01 {0x0000} \
   CONFIG.RESULT_02 {0x7FFF} \
   CONFIG.RESULT_03 {0x7FFE} \
   CONFIG.RESULT_04 {0x7FFE} \
   CONFIG.RESULT_05 {0x7FFD} \
   CONFIG.RESULT_06 {0x7FFD} \
   CONFIG.RESULT_07 {0x7FFC} \
   CONFIG.RESULT_08 {0x7FFC} \
   CONFIG.RESULT_09 {0x7FFB} \
   CONFIG.RESULT_10 {0x7FFB} \
   CONFIG.RESULT_11 {0x7FFA} \
   CONFIG.RESULT_12 {0x7FFA} \
   CONFIG.RESULT_13 {0x7FF9} \
   CONFIG.RESULT_14 {0x7FF9} \
   CONFIG.RESULT_15 {0x7FF8} \
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
   CONFIG.RESULT_00 {0x8000} \
   CONFIG.RESULT_01 {0x2F16} \
   CONFIG.RESULT_02 {0x1152} \
   CONFIG.RESULT_03 {0x065F} \
   CONFIG.RESULT_04 {0x0258} \
   CONFIG.RESULT_05 {0x00DC} \
   CONFIG.RESULT_06 {0x0051} \
   CONFIG.RESULT_07 {0x001D} \
   CONFIG.RESULT_08 {0x000A} \
   CONFIG.RESULT_09 {0x0004} \
   CONFIG.RESULT_10 {0x0001} \
   CONFIG.RESULT_11 {0x0000} \
   CONFIG.RESULT_12 {0x0000} \
   CONFIG.RESULT_13 {0x0000} \
   CONFIG.RESULT_14 {0x0000} \
   CONFIG.RESULT_15 {0x0000} \
   CONFIG.RESULT_16 {0x0000} \
   CONFIG.RESULT_17 {0x0000} \
   CONFIG.RESULT_18 {0x0000} \
   CONFIG.RESULT_19 {0x0000} \
   CONFIG.RESULT_20 {0x0000} \
   CONFIG.RESULT_21 {0x0000} \
   CONFIG.RESULT_22 {0x0000} \
   CONFIG.RESULT_23 {0x0000} \
   CONFIG.RESULT_24 {0x0000} \
   CONFIG.RESULT_25 {0x0000} \
   CONFIG.RESULT_26 {0x0000} \
   CONFIG.RESULT_27 {0x0000} \
   CONFIG.RESULT_28 {0x0000} \
   CONFIG.RESULT_29 {0x0000} \
   CONFIG.RESULT_30 {0x0000} \
   CONFIG.RESULT_31 {0x0000} \
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
   CONFIG.IN_BITS {31} \
   CONFIG.OUT_BITS {15} \
   CONFIG.SLICE_BIT_HIGH {30} \
   CONFIG.SLICE_BIT_LOW {15} \
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
   CONFIG.IN_BITS {31} \
   CONFIG.OUT_BITS {15} \
   CONFIG.SLICE_BIT_HIGH {30} \
   CONFIG.SLICE_BIT_LOW {15} \
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
   CONFIG.IN_BITS {31} \
   CONFIG.OUT_BITS {15} \
   CONFIG.SLICE_BIT_HIGH {30} \
   CONFIG.SLICE_BIT_LOW {15} \
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
   CONFIG.IN_BITS {31} \
   CONFIG.OUT_BITS {15} \
   CONFIG.SLICE_BIT_HIGH {30} \
   CONFIG.SLICE_BIT_LOW {15} \
 ] $myslice_3

  # Create instance: myslice_4, and set properties
  set block_name myslice
  set block_cell_name myslice_4
  if { [catch {set myslice_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $myslice_4 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.IN_BITS {39} \
   CONFIG.OUT_BITS {31} \
   CONFIG.SLICE_BIT_HIGH {31} \
   CONFIG.SLICE_BIT_LOW {0} \
 ] $myslice_4

  # Create instance: new_axi_m_0, and set properties
  set block_name new_axi_m
  set block_cell_name new_axi_m_0
  if { [catch {set new_axi_m_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $new_axi_m_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.C_M_START_DATA_VALUE {0x00000000} \
 ] $new_axi_m_0

  set_property -dict [ list \
   CONFIG.SUPPORTS_NARROW_BURST {0} \
   CONFIG.NUM_READ_OUTSTANDING {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {1} \
   CONFIG.MAX_BURST_LENGTH {1} \
 ] [get_bd_intf_pins /new_axi_m_0/M_AXI]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
   CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {650.000000} \
   CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.158730} \
   CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {100.000000} \
   CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {650} \
   CONFIG.PCW_ARMPLL_CTRL_FBDIV {39} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_CLK0_FREQ {100000000} \
   CONFIG.PCW_CLK1_FREQ {10000000} \
   CONFIG.PCW_CLK2_FREQ {10000000} \
   CONFIG.PCW_CLK3_FREQ {10000000} \
   CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1300.000} \
   CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {15} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {7} \
   CONFIG.PCW_DDRPLL_CTRL_FBDIV {32} \
   CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1066.667} \
   CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_DDR_RAM_HIGHADDR {0x1FFFFFFF} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET0_RESET_ENABLE {0} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET1_RESET_ENABLE {0} \
   CONFIG.PCW_ENET_RESET_ENABLE {0} \
   CONFIG.PCW_EN_EMIO_GPIO {1} \
   CONFIG.PCW_EN_GPIO {0} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {4} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {4} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
   CONFIG.PCW_FPGA_FCLK1_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK2_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK3_ENABLE {0} \
   CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {1} \
   CONFIG.PCW_GPIO_EMIO_GPIO_IO {2} \
   CONFIG.PCW_GPIO_EMIO_GPIO_WIDTH {2} \
   CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {0} \
   CONFIG.PCW_I2C0_RESET_ENABLE {0} \
   CONFIG.PCW_I2C1_RESET_ENABLE {0} \
   CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {25} \
   CONFIG.PCW_I2C_RESET_ENABLE {0} \
   CONFIG.PCW_IOPLL_CTRL_FBDIV {48} \
   CONFIG.PCW_IO_IO_PLL_FREQMHZ {1600.000} \
   CONFIG.PCW_MIO_TREE_PERIPHERALS {unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned} \
   CONFIG.PCW_MIO_TREE_SIGNALS {unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned} \
   CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {8} \
   CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {533.333374} \
   CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT {3} \
   CONFIG.PCW_UIPARAM_DDR_BL {8} \
   CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {16 Bit} \
   CONFIG.PCW_UIPARAM_DDR_CL {7} \
   CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT {10} \
   CONFIG.PCW_UIPARAM_DDR_CWL {6} \
   CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {4096 MBits} \
   CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
   CONFIG.PCW_UIPARAM_DDR_ECC {Disabled} \
   CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {525} \
   CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41J256M16 RE-125} \
   CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {15} \
   CONFIG.PCW_UIPARAM_DDR_SPEED_BIN {DDR3_1066F} \
   CONFIG.PCW_UIPARAM_DDR_T_FAW {40.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {35.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RC {48.91} \
   CONFIG.PCW_UIPARAM_DDR_T_RCD {7} \
   CONFIG.PCW_UIPARAM_DDR_T_RP {7} \
   CONFIG.PCW_USB0_RESET_ENABLE {0} \
   CONFIG.PCW_USB1_RESET_ENABLE {0} \
   CONFIG.PCW_USB_RESET_ENABLE {0} \
   CONFIG.PCW_USE_S_AXI_GP0 {0} \
   CONFIG.PCW_USE_S_AXI_GP1 {1} \
 ] $processing_system7_0

  # Create instance: ps7_0_axi_periph, and set properties
  set ps7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
 ] $ps7_0_axi_periph

  # Create instance: reg3_0, and set properties
  set block_name reg3
  set block_cell_name reg3_0
  if { [catch {set reg3_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $reg3_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.BITS {15} \
 ] $reg3_0

  # Create instance: reg3_1, and set properties
  set block_name reg3
  set block_cell_name reg3_1
  if { [catch {set reg3_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $reg3_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.BITS {15} \
 ] $reg3_1

  # Create instance: reg4_2, and set properties
  set block_name reg4
  set block_cell_name reg4_2
  if { [catch {set reg4_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $reg4_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.BITS {0} \
 ] $reg4_2

  # Create instance: reg4_3, and set properties
  set block_name reg4
  set block_cell_name reg4_3
  if { [catch {set reg4_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $reg4_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.BITS {0} \
 ] $reg4_3

  # Create instance: reg62_0, and set properties
  set block_name reg62
  set block_cell_name reg62_0
  if { [catch {set reg62_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $reg62_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.BITS {0} \
 ] $reg62_0

  # Create instance: reg64_0, and set properties
  set block_name reg64
  set block_cell_name reg64_0
  if { [catch {set reg64_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $reg64_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.BITS {0} \
 ] $reg64_0

  # Create instance: shift_r2_0, and set properties
  set block_name shift_r2
  set block_cell_name shift_r2_0
  if { [catch {set shift_r2_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $shift_r2_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_SI {1} \
 ] $smartconnect_0

  # Create instance: switch_16_8_0, and set properties
  set block_name switch_16_8
  set block_cell_name switch_16_8_0
  if { [catch {set switch_16_8_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $switch_16_8_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: w1_combine_0, and set properties
  set block_name w1_combine
  set block_cell_name w1_combine_0
  if { [catch {set w1_combine_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $w1_combine_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: w2_combine_0, and set properties
  set block_name w2_combine
  set block_cell_name w2_combine_0
  if { [catch {set w2_combine_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $w2_combine_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {01} \
   CONFIG.CONST_WIDTH {2} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {0} \
   CONFIG.DIN_TO {0} \
   CONFIG.DIN_WIDTH {2} \
 ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {1} \
   CONFIG.DIN_TO {1} \
   CONFIG.DIN_WIDTH {2} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_2

  # Create interface connections
  connect_bd_intf_net -intf_net new_axi_m_0_M_AXI [get_bd_intf_pins new_axi_m_0/M_AXI] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins ps7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M00_AXI [get_bd_intf_pins axi_s_control_0/S_AXI] [get_bd_intf_pins ps7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins processing_system7_0/S_AXI_GP1] [get_bd_intf_pins smartconnect_0/M00_AXI]

  # Create port connections
  connect_bd_net -net DIV40_32_TOP_0_quotient [get_bd_pins DIV40_32_TOP_0/quotient] [get_bd_pins myslice_4/din]
  connect_bd_net -net MUL_TOP_0_PRODUCT [get_bd_pins MUL_TOP_0/PRODUCT] [get_bd_pins myslice_0/din]
  connect_bd_net -net MUL_TOP_1_PRODUCT [get_bd_pins MUL_TOP_1/PRODUCT] [get_bd_pins myslice_1/din]
  connect_bd_net -net MUL_TOP_2_PRODUCT [get_bd_pins MUL_TOP_2/PRODUCT] [get_bd_pins myslice_2/din]
  connect_bd_net -net MUL_TOP_3_PRODUCT [get_bd_pins MUL_TOP_3/PRODUCT] [get_bd_pins myslice_3/din]
  connect_bd_net -net axi_s_control_0_slv_reg0 [get_bd_pins axi_s_control_0/slv_reg0] [get_bd_pins new_axi_m_0/W_BASEADDR]
  connect_bd_net -net axi_s_control_0_slv_reg1 [get_bd_pins axi_s_control_0/slv_reg1] [get_bd_pins new_axi_m_0/R_BASEADDR]
  connect_bd_net -net axi_s_control_0_slv_reg2 [get_bd_pins axi_s_control_0/slv_reg2] [get_bd_pins new_axi_m_0/C_M_TRANSACTIONS_NUM]
  connect_bd_net -net axi_s_control_0_slv_reg3 [get_bd_pins axi_s_control_0/slv_reg3] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net btn_switch_state_0_1 [get_bd_ports btn_switch_state_0] [get_bd_pins new_axi_m_0/btn_switch_state]
  connect_bd_net -net button_single_0_single [get_bd_pins button_single_0/single] [get_bd_pins new_axi_m_0/INIT_AXI_TXN]
  connect_bd_net -net clk_0_1 [get_bd_pins MUL_TOP_0/CLK] [get_bd_pins MUL_TOP_1/CLK] [get_bd_pins MUL_TOP_2/CLK] [get_bd_pins MUL_TOP_3/CLK] [get_bd_pins axi_s_control_0/S_AXI_ACLK] [get_bd_pins button_single_0/clk] [get_bd_pins custom_register_0/clk] [get_bd_pins custom_register_4/clk] [get_bd_pins custom_register_5/clk] [get_bd_pins custom_register_6/clk] [get_bd_pins custom_register_7/clk] [get_bd_pins div_part_clk_control_0/sys_clk] [get_bd_pins fix_shift_0/clk] [get_bd_pins myrom4bit_4/clk] [get_bd_pins myrom4bit_5/clk] [get_bd_pins myrom4bit_6/clk] [get_bd_pins myrom4bit_7/clk] [get_bd_pins myrom5bit_1/clk] [get_bd_pins new_axi_m_0/M_AXI_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_GP1_ACLK] [get_bd_pins ps7_0_axi_periph/ACLK] [get_bd_pins ps7_0_axi_periph/M00_ACLK] [get_bd_pins ps7_0_axi_periph/S00_ACLK] [get_bd_pins reg3_0/clk] [get_bd_pins reg3_1/clk] [get_bd_pins reg4_2/clk] [get_bd_pins reg4_3/clk] [get_bd_pins smartconnect_0/aclk]
  connect_bd_net -net custom_register_0_data_out [get_bd_pins custom_register_0/data_out] [get_bd_pins reg4_2/din]
  connect_bd_net -net custom_register_4_data_out [get_bd_pins custom_register_4/data_out] [get_bd_pins new_axi_m_0/write_data_valid]
  connect_bd_net -net custom_register_5_data_out [get_bd_pins custom_register_0/data_in] [get_bd_pins custom_register_5/data_out]
  connect_bd_net -net custom_register_6_data_out [get_bd_pins custom_register_4/data_in] [get_bd_pins custom_register_6/data_out]
  connect_bd_net -net custom_register_7_data_out [get_bd_pins custom_register_7/data_out] [get_bd_pins w1_combine_0/din]
  connect_bd_net -net div_part_clk_control_0_clk_out [get_bd_pins DIV40_32_TOP_0/clk] [get_bd_pins div_part_clk_control_0/clk_out] [get_bd_pins reg62_0/clk] [get_bd_pins reg64_0/clk]
  connect_bd_net -net fix_shift_0_after_point_0 [get_bd_pins fix_shift_0/after_point_0] [get_bd_pins myrom4bit_4/cur_substrate_N]
  connect_bd_net -net fix_shift_0_after_point_1 [get_bd_pins fix_shift_0/after_point_1] [get_bd_pins myrom4bit_5/cur_substrate_N]
  connect_bd_net -net fix_shift_0_after_point_2 [get_bd_pins fix_shift_0/after_point_2] [get_bd_pins myrom4bit_6/cur_substrate_N]
  connect_bd_net -net fix_shift_0_after_point_3 [get_bd_pins fix_shift_0/after_point_3] [get_bd_pins myrom4bit_7/cur_substrate_N]
  connect_bd_net -net fix_shift_0_befor_point [get_bd_pins fix_shift_0/befor_point] [get_bd_pins myrom5bit_1/cur_substrate_N]
  connect_bd_net -net myrom4bit_4_cur_result [get_bd_pins MUL_TOP_0/A] [get_bd_pins myrom4bit_4/cur_result]
  connect_bd_net -net myrom4bit_5_cur_result [get_bd_pins MUL_TOP_0/B] [get_bd_pins myrom4bit_5/cur_result]
  connect_bd_net -net myrom4bit_6_cur_result [get_bd_pins MUL_TOP_1/A] [get_bd_pins myrom4bit_6/cur_result]
  connect_bd_net -net myrom4bit_7_cur_result [get_bd_pins MUL_TOP_1/B] [get_bd_pins myrom4bit_7/cur_result]
  connect_bd_net -net myrom5bit_1_cur_result [get_bd_pins myrom5bit_1/cur_result] [get_bd_pins reg3_0/din]
  connect_bd_net -net myslice_0_dout [get_bd_pins MUL_TOP_2/A] [get_bd_pins myslice_0/dout]
  connect_bd_net -net myslice_1_dout [get_bd_pins MUL_TOP_2/B] [get_bd_pins myslice_1/dout]
  connect_bd_net -net myslice_2_dout [get_bd_pins MUL_TOP_3/A] [get_bd_pins myslice_2/dout]
  connect_bd_net -net myslice_3_dout [get_bd_pins custom_register_7/data_in] [get_bd_pins myslice_3/dout]
  connect_bd_net -net myslice_4_dout [get_bd_pins myslice_4/dout] [get_bd_pins switch_16_8_0/din]
  connect_bd_net -net new_axi_m_0_r_data [get_bd_pins fix_shift_0/input_data] [get_bd_pins new_axi_m_0/r_data]
  connect_bd_net -net new_axi_m_0_r_data_2 [get_bd_pins new_axi_m_0/r_data_2] [get_bd_pins shift_r2_0/din]
  connect_bd_net -net new_axi_m_0_read_data_valid [get_bd_pins custom_register_5/data_in] [get_bd_pins new_axi_m_0/read_data_valid] [get_bd_pins reg62_0/din] [get_bd_pins reg64_0/din]
  connect_bd_net -net new_axi_m_0_state_reg [get_bd_ports led] [get_bd_pins div_part_clk_control_0/state] [get_bd_pins new_axi_m_0/state_reg]
  connect_bd_net -net new_axi_m_0_sum [get_bd_pins DIV40_32_TOP_0/b] [get_bd_pins new_axi_m_0/sum]
  connect_bd_net -net processing_system7_0_GPIO_O [get_bd_pins processing_system7_0/GPIO_O] [get_bd_pins xlslice_1/Din] [get_bd_pins xlslice_2/Din]
  connect_bd_net -net reg3_0_dout [get_bd_pins reg3_0/dout] [get_bd_pins reg3_1/din]
  connect_bd_net -net reg3_1_dout [get_bd_pins MUL_TOP_3/B] [get_bd_pins reg3_1/dout]
  connect_bd_net -net reg4_2_dout [get_bd_pins reg4_2/dout] [get_bd_pins reg4_3/din]
  connect_bd_net -net reg4_3_dout [get_bd_pins custom_register_6/data_in] [get_bd_pins reg4_3/dout]
  connect_bd_net -net reg62_0_dout [get_bd_pins new_axi_m_0/write_data_valid_2] [get_bd_pins reg62_0/dout]
  connect_bd_net -net rst_ps7_0_100M_peripheral_aresetn [get_bd_pins DIV40_32_TOP_0/rst_n] [get_bd_pins axi_s_control_0/S_AXI_ARESETN] [get_bd_pins button_single_0/rst_n] [get_bd_pins custom_register_0/rst] [get_bd_pins custom_register_4/rst] [get_bd_pins custom_register_5/rst] [get_bd_pins custom_register_6/rst] [get_bd_pins custom_register_7/rst] [get_bd_pins fix_shift_0/rst] [get_bd_pins myrom4bit_4/rst_n] [get_bd_pins myrom4bit_5/rst_n] [get_bd_pins myrom4bit_6/rst_n] [get_bd_pins myrom4bit_7/rst_n] [get_bd_pins myrom5bit_1/rst_n] [get_bd_pins new_axi_m_0/M_AXI_ARESETN] [get_bd_pins ps7_0_axi_periph/ARESETN] [get_bd_pins ps7_0_axi_periph/M00_ARESETN] [get_bd_pins ps7_0_axi_periph/S00_ARESETN] [get_bd_pins reg3_0/rst] [get_bd_pins reg3_1/rst] [get_bd_pins reg4_2/rst] [get_bd_pins reg4_3/rst] [get_bd_pins reg62_0/rst] [get_bd_pins reg64_0/rst] [get_bd_pins smartconnect_0/aresetn] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net shift_r2_0_dout_low [get_bd_pins DIV40_32_TOP_0/a] [get_bd_pins shift_r2_0/dout_low]
  connect_bd_net -net switch_16_8_0_dout [get_bd_pins switch_16_8_0/dout] [get_bd_pins w2_combine_0/din]
  connect_bd_net -net w1_combine_0_dout [get_bd_pins new_axi_m_0/w_data] [get_bd_pins w1_combine_0/dout]
  connect_bd_net -net w2_combine_0_dout [get_bd_pins new_axi_m_0/w_data_2] [get_bd_pins w2_combine_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins MUL_TOP_0/TC] [get_bd_pins MUL_TOP_1/TC] [get_bd_pins MUL_TOP_2/TC] [get_bd_pins MUL_TOP_3/TC] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins new_axi_m_0/cur_state] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins DIV40_32_TOP_0/en] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins switch_16_8_0/switch] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_pins button_single_0/but_in] [get_bd_pins xlslice_2/Dout]

  # Create address segments
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces new_axi_m_0/M_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_GP1/GP1_DDR_LOWOCM] SEG_processing_system7_0_GP1_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000000 -offset 0x40000000 [get_bd_addr_spaces new_axi_m_0/M_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_GP1/GP1_M_AXI_GP0] SEG_processing_system7_0_GP1_M_AXI_GP0
  create_bd_addr_seg -range 0x00010000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_s_control_0/S_AXI/reg0] SEG_axi_s_control_0_reg0


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""



# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "inst_a_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "inst_b_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "inst_num_stages" -parent ${Page_0}
  ipgui::add_param $IPINST -name "inst_op_iso_mode" -parent ${Page_0}
  ipgui::add_param $IPINST -name "inst_rem_mode" -parent ${Page_0}
  ipgui::add_param $IPINST -name "inst_rst_mode" -parent ${Page_0}
  ipgui::add_param $IPINST -name "inst_stall_mode" -parent ${Page_0}
  ipgui::add_param $IPINST -name "inst_tc_mode" -parent ${Page_0}


}

proc update_PARAM_VALUE.inst_a_width { PARAM_VALUE.inst_a_width } {
	# Procedure called to update inst_a_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.inst_a_width { PARAM_VALUE.inst_a_width } {
	# Procedure called to validate inst_a_width
	return true
}

proc update_PARAM_VALUE.inst_b_width { PARAM_VALUE.inst_b_width } {
	# Procedure called to update inst_b_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.inst_b_width { PARAM_VALUE.inst_b_width } {
	# Procedure called to validate inst_b_width
	return true
}

proc update_PARAM_VALUE.inst_num_stages { PARAM_VALUE.inst_num_stages } {
	# Procedure called to update inst_num_stages when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.inst_num_stages { PARAM_VALUE.inst_num_stages } {
	# Procedure called to validate inst_num_stages
	return true
}

proc update_PARAM_VALUE.inst_op_iso_mode { PARAM_VALUE.inst_op_iso_mode } {
	# Procedure called to update inst_op_iso_mode when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.inst_op_iso_mode { PARAM_VALUE.inst_op_iso_mode } {
	# Procedure called to validate inst_op_iso_mode
	return true
}

proc update_PARAM_VALUE.inst_rem_mode { PARAM_VALUE.inst_rem_mode } {
	# Procedure called to update inst_rem_mode when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.inst_rem_mode { PARAM_VALUE.inst_rem_mode } {
	# Procedure called to validate inst_rem_mode
	return true
}

proc update_PARAM_VALUE.inst_rst_mode { PARAM_VALUE.inst_rst_mode } {
	# Procedure called to update inst_rst_mode when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.inst_rst_mode { PARAM_VALUE.inst_rst_mode } {
	# Procedure called to validate inst_rst_mode
	return true
}

proc update_PARAM_VALUE.inst_stall_mode { PARAM_VALUE.inst_stall_mode } {
	# Procedure called to update inst_stall_mode when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.inst_stall_mode { PARAM_VALUE.inst_stall_mode } {
	# Procedure called to validate inst_stall_mode
	return true
}

proc update_PARAM_VALUE.inst_tc_mode { PARAM_VALUE.inst_tc_mode } {
	# Procedure called to update inst_tc_mode when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.inst_tc_mode { PARAM_VALUE.inst_tc_mode } {
	# Procedure called to validate inst_tc_mode
	return true
}


proc update_MODELPARAM_VALUE.inst_a_width { MODELPARAM_VALUE.inst_a_width PARAM_VALUE.inst_a_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.inst_a_width}] ${MODELPARAM_VALUE.inst_a_width}
}

proc update_MODELPARAM_VALUE.inst_b_width { MODELPARAM_VALUE.inst_b_width PARAM_VALUE.inst_b_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.inst_b_width}] ${MODELPARAM_VALUE.inst_b_width}
}

proc update_MODELPARAM_VALUE.inst_tc_mode { MODELPARAM_VALUE.inst_tc_mode PARAM_VALUE.inst_tc_mode } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.inst_tc_mode}] ${MODELPARAM_VALUE.inst_tc_mode}
}

proc update_MODELPARAM_VALUE.inst_rem_mode { MODELPARAM_VALUE.inst_rem_mode PARAM_VALUE.inst_rem_mode } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.inst_rem_mode}] ${MODELPARAM_VALUE.inst_rem_mode}
}

proc update_MODELPARAM_VALUE.inst_num_stages { MODELPARAM_VALUE.inst_num_stages PARAM_VALUE.inst_num_stages } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.inst_num_stages}] ${MODELPARAM_VALUE.inst_num_stages}
}

proc update_MODELPARAM_VALUE.inst_stall_mode { MODELPARAM_VALUE.inst_stall_mode PARAM_VALUE.inst_stall_mode } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.inst_stall_mode}] ${MODELPARAM_VALUE.inst_stall_mode}
}

proc update_MODELPARAM_VALUE.inst_rst_mode { MODELPARAM_VALUE.inst_rst_mode PARAM_VALUE.inst_rst_mode } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.inst_rst_mode}] ${MODELPARAM_VALUE.inst_rst_mode}
}

proc update_MODELPARAM_VALUE.inst_op_iso_mode { MODELPARAM_VALUE.inst_op_iso_mode PARAM_VALUE.inst_op_iso_mode } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.inst_op_iso_mode}] ${MODELPARAM_VALUE.inst_op_iso_mode}
}


# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "IN_BITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OUT_BITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SLICE_BIT_HIGH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SLICE_BIT_LOW" -parent ${Page_0}


}

proc update_PARAM_VALUE.IN_BITS { PARAM_VALUE.IN_BITS } {
	# Procedure called to update IN_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IN_BITS { PARAM_VALUE.IN_BITS } {
	# Procedure called to validate IN_BITS
	return true
}

proc update_PARAM_VALUE.OUT_BITS { PARAM_VALUE.OUT_BITS } {
	# Procedure called to update OUT_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OUT_BITS { PARAM_VALUE.OUT_BITS } {
	# Procedure called to validate OUT_BITS
	return true
}

proc update_PARAM_VALUE.SLICE_BIT_HIGH { PARAM_VALUE.SLICE_BIT_HIGH } {
	# Procedure called to update SLICE_BIT_HIGH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SLICE_BIT_HIGH { PARAM_VALUE.SLICE_BIT_HIGH } {
	# Procedure called to validate SLICE_BIT_HIGH
	return true
}

proc update_PARAM_VALUE.SLICE_BIT_LOW { PARAM_VALUE.SLICE_BIT_LOW } {
	# Procedure called to update SLICE_BIT_LOW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SLICE_BIT_LOW { PARAM_VALUE.SLICE_BIT_LOW } {
	# Procedure called to validate SLICE_BIT_LOW
	return true
}


proc update_MODELPARAM_VALUE.IN_BITS { MODELPARAM_VALUE.IN_BITS PARAM_VALUE.IN_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN_BITS}] ${MODELPARAM_VALUE.IN_BITS}
}

proc update_MODELPARAM_VALUE.OUT_BITS { MODELPARAM_VALUE.OUT_BITS PARAM_VALUE.OUT_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OUT_BITS}] ${MODELPARAM_VALUE.OUT_BITS}
}

proc update_MODELPARAM_VALUE.SLICE_BIT_HIGH { MODELPARAM_VALUE.SLICE_BIT_HIGH PARAM_VALUE.SLICE_BIT_HIGH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SLICE_BIT_HIGH}] ${MODELPARAM_VALUE.SLICE_BIT_HIGH}
}

proc update_MODELPARAM_VALUE.SLICE_BIT_LOW { MODELPARAM_VALUE.SLICE_BIT_LOW PARAM_VALUE.SLICE_BIT_LOW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SLICE_BIT_LOW}] ${MODELPARAM_VALUE.SLICE_BIT_LOW}
}


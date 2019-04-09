# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

create_project -in_memory -part xc7a35tcpg236-1
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir F:/minimipsb3/minimips/minimips.cache/wt [current_project]
set_property parent.project_path F:/minimipsb3/minimips/minimips.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_ip F:/minimipsb3/minimips/minimips.srcs/sources_1/ip/irom/irom.xci
set_property used_in_implementation false [get_files -all f:/minimipsb3/minimips/minimips.srcs/sources_1/ip/irom/irom.dcp]
set_property is_locked true [get_files F:/minimipsb3/minimips/minimips.srcs/sources_1/ip/irom/irom.xci]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
catch { write_hwdef -file irom.hwdef }
synth_design -top irom -part xc7a35tcpg236-1 -mode out_of_context
rename_ref -prefix_all irom_
write_checkpoint -noxdef irom.dcp
catch { report_utilization -file irom_utilization_synth.rpt -pb irom_utilization_synth.pb }
if { [catch {
  file copy -force F:/minimipsb3/minimips/minimips.runs/irom_synth_1/irom.dcp F:/minimipsb3/minimips/minimips.srcs/sources_1/ip/irom/irom.dcp
} _RESULT ] } { 
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}
if { [catch {
  write_verilog -force -mode synth_stub F:/minimipsb3/minimips/minimips.srcs/sources_1/ip/irom/irom_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode synth_stub F:/minimipsb3/minimips/minimips.srcs/sources_1/ip/irom/irom_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_verilog -force -mode funcsim F:/minimipsb3/minimips/minimips.srcs/sources_1/ip/irom/irom_funcsim.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode funcsim F:/minimipsb3/minimips/minimips.srcs/sources_1/ip/irom/irom_funcsim.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}
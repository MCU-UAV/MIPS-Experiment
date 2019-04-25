# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/code/MIPS-Experiment/minimips/minimips.cache/wt [current_project]
set_property parent.project_path D:/code/MIPS-Experiment/minimips/minimips.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions disable [current_project]
read_ip -quiet D:/code/MIPS-Experiment/minimips/minimips.srcs/sources_1/ip/irom/irom.xci
set_property used_in_implementation false [get_files -all d:/code/MIPS-Experiment/minimips/minimips.srcs/sources_1/ip/irom/irom_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top irom -part xc7a35tcpg236-1 -mode out_of_context

rename_ref -prefix_all irom_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef irom.dcp
create_report "irom_synth_1_synth_report_utilization_0" "report_utilization -file irom_utilization_synth.rpt -pb irom_utilization_synth.pb"

if { [catch {
  write_verilog -force -mode synth_stub D:/code/MIPS-Experiment/minimips/minimips.runs/irom_synth_1/irom_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub D:/code/MIPS-Experiment/minimips/minimips.runs/irom_synth_1/irom_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim D:/code/MIPS-Experiment/minimips/minimips.runs/irom_synth_1/irom_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim D:/code/MIPS-Experiment/minimips/minimips.runs/irom_synth_1/irom_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

add_files D:/code/MIPS-Experiment/minimips/minimips.runs/irom_synth_1/irom_stub.v -of_objects [get_files D:/code/MIPS-Experiment/minimips/minimips.srcs/sources_1/ip/irom/irom.xci]

add_files D:/code/MIPS-Experiment/minimips/minimips.runs/irom_synth_1/irom_stub.vhdl -of_objects [get_files D:/code/MIPS-Experiment/minimips/minimips.srcs/sources_1/ip/irom/irom.xci]

add_files D:/code/MIPS-Experiment/minimips/minimips.runs/irom_synth_1/irom_sim_netlist.v -of_objects [get_files D:/code/MIPS-Experiment/minimips/minimips.srcs/sources_1/ip/irom/irom.xci]

add_files D:/code/MIPS-Experiment/minimips/minimips.runs/irom_synth_1/irom_sim_netlist.vhdl -of_objects [get_files D:/code/MIPS-Experiment/minimips/minimips.srcs/sources_1/ip/irom/irom.xci]

add_files D:/code/MIPS-Experiment/minimips/minimips.runs/irom_synth_1/irom.dcp -of_objects [get_files D:/code/MIPS-Experiment/minimips/minimips.srcs/sources_1/ip/irom/irom.xci]

if {[file isdir D:/code/MIPS-Experiment/minimips/minimips.ip_user_files/ip/irom]} {
  catch { 
    file copy -force D:/code/MIPS-Experiment/minimips/minimips.runs/irom_synth_1/irom_sim_netlist.v D:/code/MIPS-Experiment/minimips/minimips.ip_user_files/ip/irom
  }
}

if {[file isdir D:/code/MIPS-Experiment/minimips/minimips.ip_user_files/ip/irom]} {
  catch { 
    file copy -force D:/code/MIPS-Experiment/minimips/minimips.runs/irom_synth_1/irom_sim_netlist.vhdl D:/code/MIPS-Experiment/minimips/minimips.ip_user_files/ip/irom
  }
}

if {[file isdir D:/code/MIPS-Experiment/minimips/minimips.ip_user_files/ip/irom]} {
  catch { 
    file copy -force D:/code/MIPS-Experiment/minimips/minimips.runs/irom_synth_1/irom_stub.v D:/code/MIPS-Experiment/minimips/minimips.ip_user_files/ip/irom
  }
}

if {[file isdir D:/code/MIPS-Experiment/minimips/minimips.ip_user_files/ip/irom]} {
  catch { 
    file copy -force D:/code/MIPS-Experiment/minimips/minimips.runs/irom_synth_1/irom_stub.vhdl D:/code/MIPS-Experiment/minimips/minimips.ip_user_files/ip/irom
  }
}
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

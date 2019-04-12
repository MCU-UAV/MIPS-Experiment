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
create_project -in_memory -part xc7a200tfbg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/code/MIPS-Experiment/piplineCPU/piplineCPU.cache/wt [current_project]
set_property parent.project_path D:/code/MIPS-Experiment/piplineCPU/piplineCPU.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:ac701:part0:1.4 [current_project]
set_property ip_output_repo d:/code/MIPS-Experiment/piplineCPU/piplineCPU.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  D:/code/MIPS-Experiment/piplineCPU/piplineCPU.srcs/sources_1/new/confreg.v
  D:/code/MIPS-Experiment/piplineCPU/piplineCPU.srcs/sources_1/new/miniMIPSCPU.v
  D:/code/MIPS-Experiment/piplineCPU/piplineCPU.srcs/sources_1/new/Top.v
}
read_ip -quiet D:/code/MIPS-Experiment/piplineCPU/piplineCPU.srcs/sources_1/ip/inst_rom/inst_rom.xci
set_property used_in_implementation false [get_files -all d:/code/MIPS-Experiment/piplineCPU/piplineCPU.srcs/sources_1/ip/inst_rom/inst_rom_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top Basys3_Top -part xc7a200tfbg676-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Basys3_Top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Basys3_Top_utilization_synth.rpt -pb Basys3_Top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

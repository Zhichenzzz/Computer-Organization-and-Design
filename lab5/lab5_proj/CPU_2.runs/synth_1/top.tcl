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
set_param chipscope.maxJobs 2
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/Courses/COD/CPU_2/CPU_2.cache/wt [current_project]
set_property parent.project_path D:/Courses/COD/CPU_2/CPU_2.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/Courses/COD/CPU_2/CPU_2.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files D:/Courses/COD/CPU_2/CPU_2.ip_user_files/i.coe
read_verilog -library xil_defaultlib {
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/PCregister.v
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/Segment_reg.v
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/add.v
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/alu.v
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/control.v
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/cpu_pl.v
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/forwarding_unit.v
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/hazard_detection_unit.v
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/imm.v
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/mux2.v
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/mux3.v
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/pdu_pl.v
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/register.v
  D:/Courses/COD/CPU_2/CPU_2.srcs/sources_1/new/top.v
}
read_ip -quiet D:/Courses/COD/CPU_2/CPU_2.ip_user_files/D_mem_1/D_mem.xci
set_property used_in_implementation false [get_files -all d:/Courses/COD/CPU_2/CPU_2.ip_user_files/D_mem_1/D_mem_ooc.xdc]

read_ip -quiet D:/Courses/COD/CPU_2/CPU_2.ip_user_files/I_mem/I_mem.xci
set_property used_in_implementation false [get_files -all d:/Courses/COD/CPU_2/CPU_2.ip_user_files/I_mem/I_mem_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Courses/COD/CPU_2/CPU_2.srcs/constrs_1/top.xdc
set_property used_in_implementation false [get_files D:/Courses/COD/CPU_2/CPU_2.srcs/constrs_1/top.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top top -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

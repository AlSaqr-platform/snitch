onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/clk_i
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/rst_ni
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/test_mode_i
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/narrow_hwpe_tcdm_resp_i
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/narrow_hwpe_tcdm_req_o
add wave -noupdate -expand -subitemconfig {/tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/hwpe_ctrl_req_i.q -expand} /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/hwpe_ctrl_req_i
add wave -noupdate -expand -subitemconfig {/tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/hwpe_ctrl_resp_o.p -expand} /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/hwpe_ctrl_resp_o
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/evt_o
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/busy_o
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/tcdm_gnt_flat
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/tcdm_rvalid_flat
add wave -noupdate -divider periph
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/clk
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/req
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/gnt
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/add
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/wen
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/be
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/data
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/id
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/r_data
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/r_valid
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/r_id
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7137432 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {7118564 ps} {7159580 ps}

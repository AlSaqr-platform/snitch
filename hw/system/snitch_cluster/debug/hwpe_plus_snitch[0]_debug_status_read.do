onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group HWPE_interface /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/clk_i
add wave -noupdate -expand -group HWPE_interface /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/rst_ni
add wave -noupdate -expand -group HWPE_interface /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/test_mode_i
add wave -noupdate -expand -group HWPE_interface /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/narrow_hwpe_tcdm_resp_i
add wave -noupdate -expand -group HWPE_interface -expand -subitemconfig {{/tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/narrow_hwpe_tcdm_req_o[4]} -expand {/tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/narrow_hwpe_tcdm_req_o[3]} -expand {/tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/narrow_hwpe_tcdm_req_o[2]} -expand} /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/narrow_hwpe_tcdm_req_o
add wave -noupdate -expand -group HWPE_interface -expand /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/hwpe_ctrl_req_i
add wave -noupdate -expand -group HWPE_interface /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/hwpe_ctrl_resp_o
add wave -noupdate -expand -group HWPE_interface /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/evt_o
add wave -noupdate -expand -group HWPE_interface /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/busy_o
add wave -noupdate -expand -group HWPE_interface /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/tcdm_gnt_flat
add wave -noupdate -expand -group HWPE_interface /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/tcdm_rvalid_flat
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/clk_i
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/rst_ni
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/test_mode_i
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/busy_o
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/clear_o
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/evt_o
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/output_fill_o
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/w_shift_o
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/out_wrap_clk_en_o
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/reg_file_o
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/reg_enable_i
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/flgs_output_wrap_i
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/flgs_engine_i
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/flgs_fsm_i
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/w_loaded_i
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/flush_o
add wave -noupdate -group HWPE_CTRLer /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/accumulate_o
add wave -noupdate -group HWPE_CTRLer -expand /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/cntrl_fsm_o
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/clk_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/rst_ni
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/x_input_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/w_input_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/y_bias_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/z_output_o
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/accumulate_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/fma_is_boxed_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/noncomp_is_boxed_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/stage1_rnd_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/stage2_rnd_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/op1_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/op2_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/op_mod_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/tag_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/aux_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/in_valid_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/in_ready_o
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/reg_enable_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/flush_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/status_o
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/extension_bit_o
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/class_mask_o
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/is_class_o
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/tag_o
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/aux_o
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/out_valid_o
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/out_ready_i
add wave -noupdate -group HWPE_engine /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_redmule_engine/busy_o
add wave -noupdate -divider periph
add wave -noupdate -expand -group periph_port_HWPE /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/clk
add wave -noupdate -expand -group periph_port_HWPE /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/req
add wave -noupdate -expand -group periph_port_HWPE /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/gnt
add wave -noupdate -expand -group periph_port_HWPE /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/add
add wave -noupdate -expand -group periph_port_HWPE /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/wen
add wave -noupdate -expand -group periph_port_HWPE /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/be
add wave -noupdate -expand -group periph_port_HWPE /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/data
add wave -noupdate -expand -group periph_port_HWPE /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/id
add wave -noupdate -expand -group periph_port_HWPE /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/r_data
add wave -noupdate -expand -group periph_port_HWPE /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/r_valid
add wave -noupdate -expand -group periph_port_HWPE /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/periph/r_id
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/clk_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/rst_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/hart_id_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/irq_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/flush_i_valid_o}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/flush_i_ready_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_addr_o}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_cacheable_o}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_data_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_valid_o}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_ready_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_qreq_o}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_qvalid_o}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_qready_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_prsp_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_pvalid_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_pready_o}
add wave -noupdate -group {snitch[0]} -expand -subitemconfig {{/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/data_req_o.q} -expand} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/data_req_o}
add wave -noupdate -group {snitch[0]} -expand {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/data_rsp_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_valid_o}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_ready_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_va_o}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_ppn_o}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_pte_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_is_4mega_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/fpu_rnd_mode_o}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/fpu_fmt_mode_o}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/fpu_status_i}
add wave -noupdate -group {snitch[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/core_events_o}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/pc_d}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/pc_q}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/clk_i}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_req_o}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_req_o.q_valid}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_req_o.q.write}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_req_o.q.addr}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_req_o.q.data}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_req_o.q.strb}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_req_o.p_ready}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_rsp_i.p}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_rsp_i.p_valid}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_rsp_i.q_ready}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_req_o.q.amo}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_req_o.q.size}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_req_o.q.size}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/data_rsp_i}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/rst_i}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_qtag_i}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_qwrite_i}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_qsigned_i}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_qaddr_i}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_qdata_i}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_qsize_i}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_qamo_i}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_qvalid_i}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_qready_o}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_pdata_o}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_ptag_o}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_perror_o}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_pvalid_o}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_pready_i}
add wave -noupdate -expand -group {SNITCH[0].LSU} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/lsu_empty_o}
add wave -noupdate -expand -group {SNITCH[0].GPRF} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_regfile/clk_i}
add wave -noupdate -expand -group {SNITCH[0].GPRF} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_regfile/raddr_i}
add wave -noupdate -expand -group {SNITCH[0].GPRF} -expand {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_regfile/rdata_o}
add wave -noupdate -expand -group {SNITCH[0].GPRF} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_regfile/waddr_i}
add wave -noupdate -expand -group {SNITCH[0].GPRF} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_regfile/wdata_i}
add wave -noupdate -expand -group {SNITCH[0].GPRF} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_regfile/we_i}
add wave -noupdate -expand -group {SNITCH[0].GPRF} -expand {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_regfile/mem}
add wave -noupdate -expand -group {SNITCH[0].GPRF} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_regfile/we_dec}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/clk_i}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/rst_ni}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/irq_i}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/hive_req_o}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/hive_rsp_i}
add wave -noupdate -group {snitch_cc[0]} -expand -subitemconfig {{/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/data_req_o.q} -expand} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/data_req_o}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/data_rsp_i}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/tcdm_req_o}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/tcdm_rsp_i}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/axi_dma_req_o}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/axi_dma_res_i}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/axi_dma_busy_o}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/axi_dma_perf_o}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/axi_dma_events_o}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/core_events_o}
add wave -noupdate -group {snitch_cc[0]} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/tcdm_addr_base_i}
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/clk_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/rst_ni
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/test_mode_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/clear_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/current
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/next
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/in_fmp_valid_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/in_fmp_strb_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/weight_valid_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/weight_strb_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/y_fifo_valid_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/y_fifo_strb_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/out_fmp_ready_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/accumulate_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/engine_flush_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/reg_file_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/flgs_streamer_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/flgs_input_wrap_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/flgs_weight_wrap_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/flgs_output_wrap_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/flgs_engine_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/fifo_flgs_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/cntrl_fsm_i
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/out_fmp_strb_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/soft_clear_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/w_load_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/w_cols_lftovr_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/w_rows_lftovr_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/y_cols_lftovr_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/gate_en_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/in_wrap_clk_en_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/out_wrap_clk_en_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/reg_enable_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/out_store_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/y_buffer_load_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/cntrl_engine_o
add wave -noupdate -group HWPE_FSM -expand /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/cntrl_streamer_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/cntrl_input_wrap_o
add wave -noupdate -group HWPE_FSM /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_fsm/flgs_fsm_o
add wave -noupdate -group tcdm_interconnect /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_tcdm_interconnect/clk_i
add wave -noupdate -group tcdm_interconnect /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_tcdm_interconnect/rst_ni
add wave -noupdate -group tcdm_interconnect /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_tcdm_interconnect/req_i
add wave -noupdate -group tcdm_interconnect /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_tcdm_interconnect/rsp_o
add wave -noupdate -group tcdm_interconnect /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_tcdm_interconnect/mem_req_o
add wave -noupdate -group tcdm_interconnect /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_tcdm_interconnect/mem_rsp_i
add wave -noupdate /tb_bin/i_dut/i_snitch_cluster/i_cluster/i_snitch_hwpe_subsystem/i_redmule_top/i_control/i_slave/i_regfile/reg_file
add wave -noupdate -expand {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/i_snitch_lsu/laq_out}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 4} {43108995 ps} 0} {req {43430030 ps} 1} {resp {43437000 ps} 1}
quietly wave cursor active 1
configure wave -namecolwidth 240
configure wave -valuecolwidth 203
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
WaveRestoreZoom {43098227 ps} {43119763 ps}

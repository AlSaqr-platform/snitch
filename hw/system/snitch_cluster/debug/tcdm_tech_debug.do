onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/addr_i}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/be_i}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/clk_i}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/impl_i}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/req_i}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/rst_ni}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/wdata_i}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/we_i}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/impl_o}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/rdata_o}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/AddrWidth}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/BeWidth}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/bit_enable}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/bit_enable_neg}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/bit_enable_wide}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/ByteWidth}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/DataWidth}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/ImplKey}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/ImplOutSim}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/Latency}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/MemType}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/NumPorts}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/NumWords}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/PrintSimCfg}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/ren}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SimInit}
add wave -noupdate {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/wen}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/rst_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/hart_id_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/irq_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/flush_i_ready_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_data_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_ready_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_qready_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_prsp_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_pvalid_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/clk_i}
add wave -noupdate -expand -group S0 -expand -subitemconfig {{/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/data_req_o.q} -expand} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/data_req_o}
add wave -noupdate -expand -group S0 -expand -subitemconfig {{/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/data_rsp_i.p} -expand} {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/data_rsp_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_ready_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_pte_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_is_4mega_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/fpu_status_i}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/flush_i_valid_o}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_addr_o}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_cacheable_o}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_valid_o}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_qreq_o}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_qvalid_o}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_pready_o}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_valid_o}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_va_o}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_ppn_o}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/fpu_rnd_mode_o}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/fpu_fmt_mode_o}
add wave -noupdate -expand -group S0 {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/core_events_o}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/clk}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ren}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/wen}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/adr}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/mc}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/mcen}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/clkbyp}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/din}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/wbeb}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/wa}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/wpulse}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/wpulseen}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/fwen}
add wave -noupdate -group sram_bank_tech {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/q}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/ckgrid}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/rden}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/wren}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/adr}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/wa}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/wpulse}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/wpulseen}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/sleep}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/bc1}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/bc2}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/deepslp}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/shutoff}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/clkbyp}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/mce}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/mc}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/iso}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/datain}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/wrbiten_b}
add wave -noupdate -expand -group BMOD {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/dataout}
add wave -noupdate -expand -group ARRAY {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_array/shutoff}
add wave -noupdate -expand -group ARRAY {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_array/supply_monitor}
add wave -noupdate -expand -group ARRAY {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_array/sleep_x_pos}
add wave -noupdate -expand -group ARRAY {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_array/x_shutoff_array}
add wave -noupdate -expand -group ARRAY {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_array/x_array}
add wave -noupdate -expand -group ARRAY {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_array/x_array_adr}
add wave -noupdate -expand -group ARRAY {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_array/wrbiten_b}
add wave -noupdate -expand -group ARRAY {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_array/adr}
add wave -noupdate -expand -group ARRAY {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_array/datain}
add wave -noupdate -expand -group ARRAY {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_array/wrclk}
add wave -noupdate -expand -group ARRAY {/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_tcdm_super_bank[3]/gen_tcdm_bank[7]/i_data_mem/SNITCH_TCDM/gen_512w_64dw_8be/sram_bank_512w_64dw/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_bmod/ip224uhdlp1p11rf_512x64m4b2c1s1_t0r0p0d0a1m1h_array/dataout}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {133000 ps} 1} {{Cursor 2} {1124033 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 201
configure wave -valuecolwidth 258
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
configure wave -timelineunits ns
update
WaveRestoreZoom {1081740 ps} {1190338 ps}

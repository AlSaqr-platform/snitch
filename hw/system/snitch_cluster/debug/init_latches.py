import os

filename = "init_lateches.tcl"
out_file = open(filename, "w")
for i in range(128):
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[1]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[1]/i_tag/SNITCH_CACHE/gen_256w_39dw/cache_bank_128w_39dw_1r1w_cut0/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[1]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[1]/i_tag/SNITCH_CACHE/gen_256w_39dw/cache_bank_128w_39dw_1r1w_cut1/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[1]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[1]/i_data/SNITCH_CACHE/gen_256w_128dw/cache_bank_128w_128dw_1r1w_cut0/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[1]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[1]/i_data/SNITCH_CACHE/gen_256w_128dw/cache_bank_128w_128dw_1r1w_cut1/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[0]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[1]/i_tag/SNITCH_CACHE/gen_256w_39dw/cache_bank_128w_39dw_1r1w_cut0/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[0]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[1]/i_tag/SNITCH_CACHE/gen_256w_39dw/cache_bank_128w_39dw_1r1w_cut1/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[0]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[1]/i_data/SNITCH_CACHE/gen_256w_128dw/cache_bank_128w_128dw_1r1w_cut0/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[0]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[1]/i_data/SNITCH_CACHE/gen_256w_128dw/cache_bank_128w_128dw_1r1w_cut1/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[1]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[0]/i_tag/SNITCH_CACHE/gen_256w_39dw/cache_bank_128w_39dw_1r1w_cut0/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[1]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[0]/i_tag/SNITCH_CACHE/gen_256w_39dw/cache_bank_128w_39dw_1r1w_cut1/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[1]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[0]/i_data/SNITCH_CACHE/gen_256w_128dw/cache_bank_128w_128dw_1r1w_cut0/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[1]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[0]/i_data/SNITCH_CACHE/gen_256w_128dw/cache_bank_128w_128dw_1r1w_cut1/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[0]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[0]/i_tag/SNITCH_CACHE/gen_256w_39dw/cache_bank_128w_39dw_1r1w_cut0/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[0]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[0]/i_tag/SNITCH_CACHE/gen_256w_39dw/cache_bank_128w_39dw_1r1w_cut1/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[0]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[0]/i_data/SNITCH_CACHE/gen_256w_128dw/cache_bank_128w_128dw_1r1w_cut0/ARRAY['+str(i)+']} 0 \n')
    out_file.write('force -deposit {sim:/tb_bin/i_dut/i_snitch_cluster/i_cluster/gen_hive[0]/i_snitch_hive/i_snitch_icache/i_lookup/g_sets[0]/i_data/SNITCH_CACHE/gen_256w_128dw/cache_bank_128w_128dw_1r1w_cut1/ARRAY['+str(i)+']} 0 \n')
out_file.close()
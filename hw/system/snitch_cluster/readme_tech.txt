# compile testsuite
from top folder "snitch" launch
cd hw/system/snitch_cluster/sw && mkdir build && cd build && cmake -DCMAKE_TOOLCHAIN_FILE=toolchain-llvm -DBUILD_TESTS=ON .. && make

# compile tech RTL
cd hw/system/snitch_cluster
git clone git@iis-git.ee.ethz.ch:garofalo/intel16.git
build the cockpit -- cd intel16 && icdesign intel16 -update all -nogui
build the RTL with "make -B bin/snitch_cluster.vsim"
then launch the application with "./bin/snitch_cluster.vsim.gui sw/build/hwpe/<example app like hwpe_run>

# compile tech independent RTL
substitute line 96 of hw/system/snitch_cluster/Makefile 
${BENDER} script vsim ${VSIM_BENDER} -t rtl -t tech_mem -t tech_cells_generic_exclude_tc_sram --vlog-arg="${VLOG_FLAGS} -work $(dir $@) " > $@
with
${BENDER} script vsim ${VSIM_BENDER} -t rtl --vlog-arg="${VLOG_FLAGS} -work $(dir $@) " > $@
build the RTL with "make -B bin/snitch_cluster.vsim"
then launch the application with "./bin/snitch_cluster.vsim.gui sw/build/hwpe/<example app like hwpe_run>

all waveform setup is under "debug" folder
there is also a script to initialize the latches at the beginning of the simulation

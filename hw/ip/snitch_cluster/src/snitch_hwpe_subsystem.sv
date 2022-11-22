// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51

// Author: Angelo Garofalo <agarofalo@iis.ee.ethz.ch>

// includes
`include "axi/assign.svh"
`include "axi/typedef.svh"
`include "common_cells/assertions.svh"
`include "common_cells/registers.svh"

`include "mem_interface/typedef.svh"
`include "register_interface/typedef.svh"
`include "reqrsp_interface/typedef.svh"
`include "tcdm_interface/typedef.svh"
`include "snitch_vm/typedef.svh"

// This module wraps the hardware processing engine
// and expose its data and ctrl interfaces towards the snitch cluster

module snitch_hwpe_subsystem #(
	// struct params
    parameter type tcdm_req_t = logic,
    parameter type tcdm_rsp_t = logic,
	// hwpe params
	parameter int unsigned CtrlAddrWidth       = 32,
	parameter int unsigned CtrlDataWidth       = 32,
	parameter int unsigned AccAddrWidth        = 32,
	parameter int unsigned AccDataWidth        = 288,
	parameter int unsigned IdWidth             = 8,
	parameter int unsigned NrCores             = 8,
	// system params
	parameter int unsigned  NarrowDataWidth     = 64,
	parameter int unsigned  TCDMBankDataWidth  = 64,
	localparam int unsigned NrNarrowPorts       = (AccDataWidth / NarrowDataWidth)
	)
(
	input clk_i, 
	input rst_ni, 
	input test_mode_i,
	
	// data interface towards the memory (HWPE mst of the interco)
	input  tcdm_rsp_t [NrNarrowPorts-1:0] narrow_hwpe_tcdm_resp_i, // check datawidth of this typedef "tcdm_rsp_t"
	output tcdm_req_t [NrNarrowPorts-1:0] narrow_hwpe_tcdm_req_o,
	
	// ctrl interface towards the hwpe (hwpe is AXI slave)
	input  tcdm_req_t hwpe_ctrl_req_i,
	output tcdm_rsp_t hwpe_ctrl_resp_o
	
);


// internal signals definition: hwpe ctrl interface
// (TODO): remove explicit width of signals. Use parameters aligned with system
// here you might want to cut 32 MSbits of the axi_slv_hwpe_cfg* which is 64-bit wide
// snitch issues 32-bit int data. bus is 64-bit wide
logic periph_req;
logic periph_gnt;
logic [CtrlAddrWidth- 1:0] periph_add;
logic periph_wen;
logic [3:0] periph_be;
logic [CtrlDataWidth- 1:0] periph_data;
logic [IdWidth-1:0] periph_id;
logic [CtrlDataWidth- 1:0] periph_r_data;
logic periph_r_valid;
logic [IdWidth-1:0] periph_r_id;

// internal signals definition: hwpe data interface
logic [NrNarrowPorts-1:0] tcdm_req;
logic [NrNarrowPorts-1:0] tcdm_gnt;
logic [NrNarrowPorts-1:0][AccAddrWidth- 1:0] tcdm_add;
logic [NrNarrowPorts-1:0] tcdm_wen;
logic [NrNarrowPorts-1:0][TCDMBankDataWidth/8- 1:0] tcdm_be;
logic [NrNarrowPorts-1:0][TCDMBankDataWidth- 1:0] tcdm_data;
logic [NrNarrowPorts-1:0][TCDMBankDataWidth- 1:0] tcdm_r_data;
logic [NrNarrowPorts-1:0] tcdm_r_valid;
logic tcdm_r_opc;
logic tcdm_r_user;

// internal signals definition: event signals
logic [NrCores-1:0][1:0] evt_o;

// internal signals definition: busy signal
logic busy_o;


// clock gating cells
// TO DO


// binding tcdm struct with hwpe internals (from tcdm to pure req/gnt) -- ctrl port
assign periph_req   		  = hwpe_ctrl_req_i.q_valid;
assign periph_add   		  = hwpe_ctrl_req_i.q_addr;
assign periph_wen   		  = hwpe_ctrl_req_i.q_write;
assign periph_wdata 		  = hwpe_ctrl_req_i.q_data[31:0]; // (TODO) Parametrize
assign periph_be    		  = hwpe_ctrl_req_i.q_strb;
assign periph_id              = hwpe_ctrl_req_i.q_user;
assign hwpe_ctrl_resp_o.p_data  = periph_r_data;
assign hwpe_ctrl_resp_o.p_valid = periph_r_valid;

// binding tcdm struct with hwpe internals (from tcdm to pure req/gnt)-- data port
assign narrow_hwpe_tcdm_req_o.q_valid = tcdm_req;
assign narrow_hwpe_tcdm_req_o.q_addr  = tcdm_add;
assign narrow_hwpe_tcdm_req_o.q_data  = tcdm_data;
assign narrow_hwpe_tcdm_req_o.q_write = tcdm_wen; // check polarity
assign narrow_hwpe_tcdm_req_o.q_strb  = tcdm_be;
assign narrow_hwpe_tcdm_req_o.q_amo   = '0; // check for 'neutral' values
assign narrow_hwpe_tcdm_req_o.q_user  = '0; // check for 'neutral' values
assign tcdm_gnt                       = narrow_hwpe_tcdm_req_o.q_ready;
assign tcdm_r_data                    = narrow_hwpe_tcdm_resp_i.p_data;
assign tcdm_r_valid                   = narrow_hwpe_tcdm_resp_i.p_valid;


// tensorcore instance
redmule_wrap #(
	//.ID_WIDTH         (IdWidth), // (TODO) specify value 
	.NrCores          (NrCores),
	.AccDataWidth     (AccDataWidth),
	.AccAddrWidth     (AccAddrWidth),
	.TCDMBankDataWidth(TCDMBankDataWidth),
	.CtrlDataWidth    (CtrlDataWidth),
	.CtrlAddrWidth    (CtrlAddrWidth)
) i_redmule_wrap (
	.clk_i         (clk_i         ),
	.rst_ni        (rst_ni        ),
	.test_mode_i   (test_mode_i   ),
	.evt_o         (evt_o         ), // TODO: Check connection ! Signal/port not matching : Expecting logic [Nrcores-1:0][1:0]  -- Found logic [NrCores-1:0][1:0] 
	.busy_o        (busy_o        ),
	.tcdm_req      (tcdm_req      ),
	.tcdm_gnt      (tcdm_gnt      ),
	.tcdm_add      (tcdm_add      ), // TODO: Check connection ! Signal/port not matching : Expecting logic [NrNarrowPorts-1:0][AccAddrWidth-1:0]  -- Found logic [NrNarrowPorts-1:0][31:0] 
	.tcdm_wen      (tcdm_wen      ),
	.tcdm_be       (tcdm_be       ),
	.tcdm_data     (tcdm_data     ), // TODO: Check connection ! Signal/port not matching : Expecting logic [NrNarrowPorts-1:0][TCDMBankDataWidth-1:0]  -- Found logic [NrNarrowPorts-1:0][TCDMBankDataWidth-1:0] 
	.tcdm_r_data   (tcdm_r_data   ), // TODO: Check connection ! Signal/port not matching : Expecting logic [NrNarrowPorts-1:0][TCDMBankDataWidth-1:0]  -- Found logic [NrNarrowPorts-1:0][TCDMBankDataWidth-1:0] 
	.tcdm_r_valid  (tcdm_r_valid  ),
	.tcdm_r_opc    (tcdm_r_opc    ),
	.tcdm_r_user   (tcdm_r_user   ),
	.periph_req    (periph_req    ),
	.periph_gnt    (periph_gnt    ),
	.periph_add    (periph_add    ),
	.periph_wen    (periph_wen    ),
	.periph_be     (periph_be     ),
	.periph_data   (periph_data   ),
	.periph_id     (periph_id     ),
	.periph_r_data (periph_r_data ),
	.periph_r_valid(periph_r_valid),
	.periph_r_id   (periph_r_id   )
);

// ASSERTION

endmodule : snitch_hwpe_subsystem


// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51

// Author: Angelo Garofalo <agarofalo@iis.ee.ethz.ch>

/**************************************************/
/* This module wraps the hardware processing engine
   and expose its data and ctrl interfaces 
   towards the snitch cluster */
/**************************************************/

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

module snitch_hwpe_subsystem 
import fpnew_pkg::*;
import hci_package::*;
import redmule_pkg::*;
import hwpe_ctrl_package::*;
import hwpe_stream_package::*;
import reqrsp_pkg::amo_op_e;
#(
	// struct params
  parameter type         tcdm_req_t          = logic,
  parameter type         tcdm_rsp_t          = logic,
	// hwpe params
	parameter int unsigned CtrlAddrWidth       = 32,
	parameter int unsigned CtrlDataWidth       = 32,
	parameter int unsigned AccAddrWidth        = 32,
	parameter int unsigned AccDataWidth        = 288,
	parameter int unsigned IdWidth             = 8,
	parameter int unsigned NrCores             = 8,
	// system params
	parameter int unsigned   NarrowDataWidth     = 64,
	parameter int unsigned   TCDMBankDataWidth   = 64,
  parameter int unsigned   NrNarrowPorts       = (AccDataWidth / NarrowDataWidth),

  localparam int unsigned  BankOffsetAddr      = TCDMBankDataWidth/8 // assuming banks are byte addressable
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

/**********************************/
/* Internal Signals declaration   */
/**********************************/

// internal signals definition: event signals
logic [NrCores-1:0][1:0] evt_o;

// internal signals definition: busy signal
logic busy_o;


// clock gating cells
// TO DO

// ctrl and data itf
hci_core_intf #(.DW(AccDataWidth)) tcdm (.clk(clk_i));
hwpe_ctrl_intf_periph #(.ID_WIDTH(IdWidth)) periph (.clk(clk_i));


/********************************************************************************/
// binding tcdm struct with hwpe internals (from tcdm to pure req/gnt)-- data port
/********************************************************************************/
// internal tcdm response channel signals
logic [NrNarrowPorts-1: 0] tcdm_gnt_flat;
logic [NrNarrowPorts-1: 0] tcdm_rvalid_flat;
//bindings
genvar i;
generate
  for (i = 0; i < NrNarrowPorts; i++) begin
    // request channel
    assign narrow_hwpe_tcdm_req_o[i].q_valid             = tcdm.req;
    assign narrow_hwpe_tcdm_req_o[i].q.addr              = tcdm.add + i* BankOffsetAddr;
    assign narrow_hwpe_tcdm_req_o[i].q.write             = tcdm.wen;
    assign narrow_hwpe_tcdm_req_o[i].q.strb              = tcdm.be[(i+1) * BankOffsetAddr -1 : i * BankOffsetAddr];
    assign narrow_hwpe_tcdm_req_o[i].q.data              = tcdm.data[(i+1)*TCDMBankDataWidth - 1 : i * TCDMBankDataWidth];
    assign narrow_hwpe_tcdm_req_o[i].q.amo               = reqrsp_pkg::AMONone;
    assign narrow_hwpe_tcdm_req_o[i].q.user.core_id      = '0;
    assign narrow_hwpe_tcdm_req_o[i].q.user.is_core      = 1'b0;
    // response channel
    assign tcdm_rvalid_flat[i]                           = narrow_hwpe_tcdm_resp_i[i].p_valid;
    assign tcdm_gnt_flat[i]                              = narrow_hwpe_tcdm_resp_i[i].q_ready; // check for a cleaner way
    assign tcdm.r_data[(i+1)*TCDMBankDataWidth - 1 : i * TCDMBankDataWidth] = narrow_hwpe_tcdm_resp_i[i].p.data;
  end
  assign tcdm.gnt                                        = &(tcdm_gnt_flat);
  assign tcdm.r_valid                                    = &(tcdm_rvalid_flat);
endgenerate


/**********************************************************************************/
// binding tcdm struct with hwpe internals (from tcdm to pure req/gnt) -- ctrl port
/**********************************************************************************/
always_comb begin
  periph.req               = hwpe_ctrl_req_i.q_valid;
  periph.add               = hwpe_ctrl_req_i.q.addr;
  periph.wen               = hwpe_ctrl_req_i.q.write;
  periph.data              = hwpe_ctrl_req_i.q.data[31:0]; // (TODO) Parametrize
  periph.be                = hwpe_ctrl_req_i.q.strb;
  periph.id                = hwpe_ctrl_req_i.q.user;
  hwpe_ctrl_resp_o.q_ready = periph.gnt;
  hwpe_ctrl_resp_o.p.data  = periph.r_data;
  hwpe_ctrl_resp_o.p_valid = periph.r_valid;
end


/*******************/
/* HWPE Instance   */
/*******************/

redmule_top #(
  .ID_WIDTH     ( IdWidth      ),
  .N_CORES      ( NrCores      ),
  .DW           ( AccDataWidth )
) i_redmule_top (
  .clk_i        ( clk_i        ),
  .rst_ni       ( rst_ni       ),
  .test_mode_i  ( test_mode_i  ),
  .evt_o        ( evt_o        ),
  .busy_o       ( busy_o       ),
  .tcdm         ( tcdm         ),
  .periph       ( periph       )
);


/***************/
/* Assertions  */
/***************/

endmodule : snitch_hwpe_subsystem


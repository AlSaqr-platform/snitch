// Copyright 2020 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "hwpe_snitch_redmule_archi.h"
#include "tensor_dim.h"


#ifndef __HWPE_SNITCH_REDMULE_ARCHI_H__
#define __HWPE_SNITCH_REDMULE_ARCHI_H__

/*
* Control and generic configuration register layout
* ================================================================================
*  # reg |  offset  |  bits   |   bitmask    ||  content
* -------+----------+---------+--------------++-----------------------------------
*     0  |  0x0000  |  31: 0  |  0xffffffff  ||  TRIGGER
*     1  |  0x0004  |  31: 0  |  0xffffffff  ||  ACQUIRE
*     2  |  0x0008  |  31: 0  |  0xffffffff  ||  FINISHED
*     3  |  0x000c  |  31: 0  |  0xffffffff  ||  STATUS
*     4  |  0x0010  |  31: 0  |  0xffffffff  ||  RUNNING_JOB
*     5  |  0x0014  |  31: 0  |  0xffffffff  ||  SOFT_CLEAR
*   6-7  |          |         |              ||  Reserved
*     8  |  0x0020  |  31: 0  |  0xffffffff  ||  BYTECODE0 [31:0]
*     9  |  0x0024  |  31: 0  |  0xffffffff  ||  BYTECODE1 [63:32]
*    10  |  0x0028  |  31: 0  |  0xffffffff  ||  BYTECODE2 [95:64]
*    11  |  0x002c  |  31: 0  |  0xffffffff  ||  BYTECODE3 [127:96]
*    12  |  0x0030  |  31: 0  |  0xffffffff  ||  BYTECODE4 [159:128]
*    13  |  0x0034  |  31:16  |  0xffff0000  ||  LOOPS0    [15:0]
*        |          |  15: 0  |  0x0000ffff  ||  BYTECODE5 [175:160]
*    14  |  0x0038  |  31: 0  |  0xffffffff  ||  LOOPS1    [47:16]
*    15  |          |  31: 0  |  0xffffffff  ||  Reserved
* ================================================================================
*
* Job-dependent registers layout
* ================================================================================
*  # reg |  offset  |  bits   |   bitmask    ||  content
* -------+----------+---------+--------------++-----------------------------------
*     0  |  0x0040  |  31: 0  |  0xffffffff  ||  X_POINTER
*     1  |  0x0044  |  31: 0  |  0xffffffff  ||  W_POINTER
*     2  |  0x0048  |  31: 0  |  0xffffffff  ||  Y_POINTER
*     3  |  0x004C  |  31: 0  |  0xffffffff  ||  Z_POINTER
*     4  |  0x0050  |  31: 0  |  0xffffffff  ||  X_ITER
*     5  |  0x0054  |  31: 0  |  0xffffffff  ||  W_ITER
*     6  |  0x0058  |  31:16  |  0xffff0000  ||  LEFT_PARAMS
*        |          |   0: 0  |  0x00000001  ||  SIMPLEMUL
*     7  |  0x005C  |  31: 0  |  0xffffffff  ||  VECTSTRIDE
*     8  |  0x0060  |  31: 0  |  0xffffffff  ||  VECTSTRIDE2
* ================================================================================
* FIX-ME: CONCLUDE THE TABLE
*/

void hwpe_clock_enable();

void redmule_cfg (uint16_t m_size, uint16_t n_size, uint16_t k_size, uint8_t gemm_ops, uint8_t check_writes);

void hwpe_soft_clear();

void acquire_job();

void hwpe_start_execution();

void hwpe_eoc_polling();

void hwpe_cfg_mem_pointers(uint8_t *x, uint8_t *w, uint8_t *y, uint8_t *z );

void redmule_cfg_test();

#endif

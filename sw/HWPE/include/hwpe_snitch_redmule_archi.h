// Copyright 2020 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#ifndef __HWPE_SNITCH_REDMULE_ARCHI_H__
#define __HWPE_SNITCH_REDMULE_ARCHI_H__

/*
 * Control and generic configuration register layout
 * ================================================================================
 *  # reg |  offset  |  bits   |   bitmask    ||  content
 * -------+----------+---------+--------------++-----------------------------------
 *     0  |  0x0000  |  31: 0  |  0xffffffff  ||  TRIGGER
 *     1  |  0x0004  |  31: 0  |  0xffffffff  ||  ACQUIRE
 *     2  |  0x0008  |  31: 0  |  0xffffffff  ||  EVT_ENABLE
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
 *     0  |  0x0040  |  31: 0  |  0xffffffff  ||  A_ADDR
 *     1  |  0x0044  |  31: 0  |  0xffffffff  ||  B_ADDR
 *     2  |  0x0048  |  31: 0  |  0xffffffff  ||  C_ADDR
 *     3  |  0x004c  |  31: 0  |  0xffffffff  ||  D_ADDR
 *     4  |  0x0050  |  31: 0  |  0xffffffff  ||  NB_ITER
 *     5  |  0x0054  |  31: 0  |  0xffffffff  ||  LEN_ITER
 *     6  |  0x0058  |  31:16  |  0xffff0000  ||  SHIFT
 *        |          |   0: 0  |  0x00000001  ||  SIMPLEMUL
 *     7  |  0x005c  |  31: 0  |  0xffffffff  ||  VECTSTRIDE
 *     8  |  0x0060  |  31: 0  |  0xffffffff  ||  VECTSTRIDE2
 * ================================================================================
 *
 */

#define ARCHI_CL_EVT_ACC0 0
#define ARCHI_CL_EVT_ACC1 1
#define __builtin_bitinsert(a,b,c,d) (a | (((b << (32-c)) >> (32-c)) << d))

// RedMulE architecture
#define ADDR_WIDTH   32
#define DATA_WIDTH   256
#define FPFORMAT     16
#define ARRAY_HEIGHT 4
#define ARRAY_WIDTH  8
#define PIPE_REGS    3

// Base address
#define REDMULE_ADDR_BASE   0x000000140000
#define CLUS_CTRL_ADDR_BASE 0x000000100000

// events not defined in snitch clusters
//#define REDMULE_EVT0        XXXXXXX
//#define REDMULE_EVT1        XXXXXXX

#define CLUS_CTRL_REDMULE_OFFS              0x18
#define CLUS_CTRL_REDMULE_CG_EN_MASK        0x800
#define CLUS_CTRL_REDMULE_HCI_PRIO_MASK     0x100
#define CLUS_CTRL_REDMULE_HCI_MAXSTALL_MASK 0xff

#define REDMULE_COMMIT_CMD       1
#define REDMULE_TRIGGER_CMD      0
#define REDMULE_SOFT_CLEAR_ALL   0
#define REDMULE_SOFT_CLEAR_STATE 1

// Commands
#define REDMULE_TRIGGER                0x00
#define REDMULE_ACQUIRE                0x04
#define REDMULE_FINISHED               0x08
#define REDMULE_STATUS                 0x0C
#define REDMULE_RUNNING_JOB            0x10
#define REDMULE_SOFT_CLEAR             0x14

// Registers
#define REDMULE_REG_OFFS               0x40
#define REDMULE_REG_X_PTR              0x00
#define REDMULE_REG_W_PTR              0x04
#define REDMULE_REG_Y_PTR              0x08
#define REDMULE_REG_Z_PTR              0x0C
#define REDMULE_REG_X_ITER_PTR         0x10
#define REDMULE_REG_W_ITER_PTR         0x14
#define REDMULE_REG_LEFTOVERS_PTR      0x18
#define REDMULE_REG_LEFT_PARAMS_PTR    0x1C
#define REDMULE_REG_X_D1_STRIDE_PTR    0x20
#define REDMULE_REG_W_TOT_LEN_PTR      0x24
#define REDMULE_REG_TOT_X_READ_PTR     0x28
#define REDMULE_REG_W_D0_STRIDE_PTR    0x2C
#define REDMULE_REG_YZ_TOT_LEN_PTR     0x30
#define REDMULE_REG_YZ_D0_STRIDE_PTR   0x34
#define REDMULE_REG_YZ_D2_STRIDE_PTR   0x38
#define REDMULE_REG_X_ROWS_OFFS_PTR    0x3C
#define REDMULE_REG_X_BUFFER_SLOTS_PTR 0x40
#define REDMULE_REG_X_TOT_LEN_PTR      0x44
#define REDMULE_REG_OP_SELECTION       0x48

// OPs definition
#define MATMUL 0x0
#define GEMM   0x1
#define ADDMAX 0x2
#define ADDMIN 0x3
#define MULMAX 0x4
#define MULMIN 0x5
#define MAXMIN 0x6
#define MINMAX 0x7

#define RNE       0x0
#define RTZ       0x1
#define OP_FMADD  0x0
#define OP_ADD    0x2
#define OP_MUL    0x3
#define OP_MINMAX 0x7

// FP Formats encoding
#define FP16    0x2
#define FP8     0x3
#define FP16ALT 0x4
#define FP8ALT  0x5

#endif

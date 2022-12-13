// Copyright 2020 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "printf.h"
#include "snrt.h"
#include <stdint.h>
#include <hwpe_snitch_redmule_hal.h>

//#define VERBOSE

#define REDMULE_WRITE_CMD(offset, value)        *(int volatile *)(REDMULE_ADDR_BASE + offset) = value
#define REDMULE_WRITE_CMD_BE(offset, value, be) *(char volatile *)(REDMULE_ADDR_BASE + offset + be) = value
#define REDMULE_READ_CMD(ret, offset)           ret = (*(int volatile *)(REDMULE_ADDR_BASE + offset))

#define REDMULE_WRITE_REG(offset, value)        *(int volatile *)(REDMULE_ADDR_BASE + REDMULE_REG_OFFS + offset) = value
#define REDMULE_WRITE_REG_BE(offset, value, be) *(char volatile *)(REDMULE_ADDR_BASE + REDMULE_REG_OFFS + offset + be) = value
#define REDMULE_READ_REG(ret, offset)           ret = (*(int volatile *)(REDMULE_ADDR_BASE + REDMULE_REG_OFFS + offset))

#define REDMULE_CG_ENABLE()  *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_REDMULE_OFFS) |=  CLUS_CTRL_REDMULE_CG_EN_MASK
#define REDMULE_CG_DISABLE() *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_REDMULE_OFFS) &= ~CLUS_CTRL_REDMULE_CG_EN_MASK

// FEATURES CURRENTLY NOT AVAILABLE ON SNITCH CLUSTERS
//#define REDMULE_SETPRIORITY_CORE() *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_REDMULE_OFFS) &= ~CLUS_CTRL_REDMULE_HCI_PRIO_MASK
//#define REDMULE_SETPRIORITY_REDMULE() *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_REDMULE_OFFS) |=  CLUS_CTRL_REDMULE_HCI_PRIO_MASK
//#define REDMULE_RESET_MAXSTALL()  *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_REDMULE_OFFS) &= ~CLUS_CTRL_REDMULE_HCI_MAXSTALL_MASK
//#define REDMULE_SET_MAXSTALL(val) *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_REDMULE_OFFS) |=  (val & CLUS_CTRL_REDMULE_HCI_MAXSTALL_MASK)

#define REDMULE_BUSYWAIT()              do {                                         } while((*(int volatile *)(REDMULE_ADDR_BASE + REDMULE_STATUS)) != 0)
#define REDMULE_ACQUIRE_JOB(job_id) job_id = REDMULE_READ_CMD(job_id, REDMULE_ACQUIRE);

// clk enable fx --> does not work on snitch clusters (no evt unit)
void hwpe_clock_enable(){
   REDMULE_CG_ENABLE();
}

// soft clear
void hwpe_soft_clear(){
  REDMULE_WRITE_CMD(REDMULE_SOFT_CLEAR, REDMULE_SOFT_CLEAR_ALL);
  for(volatile int kk=0; kk<10; kk++);
}

// acquire job
void acquire_job(){
  int job_id = -1;
  REDMULE_ACQUIRE_JOB(job_id);
}

// trigger FSM
void hwpe_start_execution(){
  REDMULE_WRITE_CMD(REDMULE_TRIGGER, REDMULE_TRIGGER_CMD);
  for(volatile int kk=0; kk<10; kk++);
}

// wait hwpe EOC polling
void hwpe_eoc_polling(){
  int volatile status_read;
  do {
    REDMULE_READ_CMD(status_read, REDMULE_STATUS);
  }
  while (status_read!=0);
}

// cfg data pointers 
void hwpe_cfg_mem_pointers(uint8_t *x, uint8_t *w, uint8_t *y, uint8_t *z ){
  REDMULE_WRITE_REG(REDMULE_REG_X_PTR, x);
  REDMULE_WRITE_REG(REDMULE_REG_W_PTR, w);
  REDMULE_WRITE_REG(REDMULE_REG_Y_PTR, y);
  REDMULE_WRITE_REG(REDMULE_REG_Z_PTR, z);
}

// redmule configuration fx
void redmule_cfg (uint16_t m_size, uint16_t n_size, uint16_t k_size, uint8_t gemm_ops, uint8_t check_writes){
  uint32_t x_iters        = 0;
  uint32_t w_iters        = 0;
  uint32_t leftovers      = 0;
  uint32_t left_params    = 0;
  uint32_t x_d1_stride    = 0;
  uint32_t x_rows_offs    = 0;
  uint32_t w_tot_len      = 0;
  uint32_t w_d1_len       = 0;
  uint32_t w_d0_stride    = 0;
  uint32_t yz_tot_len     = 0;
  uint32_t yz_d0_stride   = 0;
  uint32_t yz_d2_stride   = 0;
  uint32_t tot_x_read     = 0;
  uint32_t x_buffer_slots = 0;
  uint32_t op_selection   = 0;
  uint16_t tot_stores     = 0;
  uint16_t w_rows         = n_size;
  uint16_t depth          = DATA_WIDTH/(ARRAY_HEIGHT*FPFORMAT);
  uint8_t  tile           = ARRAY_HEIGHT*(PIPE_REGS + 1);
  _Bool    x_rows_sub     = 0;
  _Bool    x_cols_sub     = 0;
  _Bool    w_cols_sub     = 0;

  uint16_t x_rows_iter,
  x_rows_iter_tmp,
  w_rows_iter,
  w_rows_iter_tmp;
  uint16_t x_cols_iter,
  x_cols_iter_tmp,
  w_cols_iter,
  w_cols_iter_tmp;
  uint8_t  x_rows_lftovr,
  x_cols_lftovr,
  w_rows_lftovr,
  w_cols_lftovr,
  slots;

  // Calculating the number of iterations alng the two dimensions of the X matrix
  x_rows_iter_tmp = m_size/ARRAY_WIDTH;
  x_cols_iter_tmp = n_size/tile;

  // Calculating the number of iterations alng the two dimensions of the W matrix
  w_rows_iter = w_rows;
  w_cols_iter_tmp = k_size/tile;

  // Calculating the residuals along the input dimensions
  x_rows_lftovr = m_size - (x_rows_iter_tmp*ARRAY_WIDTH);
  x_cols_lftovr = n_size - (x_cols_iter_tmp*tile);

  // Calculating the residuals along the weight dimensions
  w_rows_lftovr = n_size - (ARRAY_HEIGHT*(w_rows/ARRAY_HEIGHT));
  w_cols_lftovr = k_size - (w_cols_iter_tmp*tile);

  if (w_cols_lftovr != 0)
    w_cols_iter = w_cols_iter_tmp + 1;
  else 
    w_cols_iter = w_cols_iter_tmp;

  if (x_cols_lftovr != 0)
    x_cols_iter = x_cols_iter_tmp + 1;
  else 
    x_cols_iter = x_cols_iter_tmp;

  if (x_rows_lftovr != 0)
    x_rows_iter = x_rows_iter_tmp + 1;
  else 
    x_rows_iter = x_rows_iter_tmp;

  if (x_cols_lftovr%depth != 0)
    x_buffer_slots = x_cols_lftovr/depth + 1;
  else
    x_buffer_slots = x_cols_lftovr/depth;

  // Calculating the number of total stores
  tot_stores = x_rows_iter*w_cols_iter;

  // Determining if input matrixes are sub-matrixes
  if (m_size < ARRAY_WIDTH)
    x_rows_sub = 1;
  if (n_size < ARRAY_HEIGHT)
    x_cols_sub = 1;
  if (k_size < tile)
    w_cols_sub = 1;

  // Operation selection
  switch (gemm_ops) {
    case MATMUL:
      op_selection |= (RNE << 29 | RNE << 26 | OP_FMADD << 22 | OP_MINMAX << 18 | SRC_FMT << 15 | DST_FMT << 12) | 0;
    break;

    case GEMM:
      op_selection |= (RNE << 29 | RNE << 26 | OP_FMADD << 22 | OP_MINMAX << 18 | SRC_FMT << 15 | DST_FMT << 12) | 1;
    break;

    case ADDMAX:
      op_selection |= (RNE << 29 | RTZ << 26 | OP_ADD << 22 | OP_MINMAX << 18 | SRC_FMT << 15 | DST_FMT << 12) | 1;
    break;

    case ADDMIN:
      op_selection |= (RNE << 29 | RNE << 26 | OP_ADD << 22 | OP_MINMAX << 18 | SRC_FMT << 15 | DST_FMT << 12) | 1;
    break;

    case MULMAX:
      op_selection |= (RNE << 29 | RTZ << 26 | OP_MUL << 22 | OP_MINMAX << 18 | SRC_FMT << 15 | DST_FMT << 12) | 1;
    break;

    case MULMIN:
      op_selection |= (RNE << 29 | RNE << 26 | OP_MUL << 22 | OP_MINMAX << 18 | SRC_FMT << 15 | DST_FMT << 12) | 1;
    break;

    case MAXMIN:
      op_selection |= (RTZ << 29 | RNE << 26 | OP_MINMAX << 22 | OP_MINMAX << 18 | SRC_FMT << 15 | DST_FMT << 12) | 1;
    break;

    case MINMAX:
      op_selection |= (RNE << 29 | RTZ << 26 | OP_MINMAX << 22 | OP_MINMAX << 18 | SRC_FMT << 15 | DST_FMT << 12) | 1;
    break;
  }

  // Storing iterations and residuals in registers
  x_iters      |= x_rows_iter   << 16 | x_cols_iter   << 0;
  w_iters      |= w_rows_iter   << 16 | w_cols_iter   << 0;
  leftovers    |= x_rows_lftovr << 24 | x_cols_lftovr << 16 | w_rows_lftovr << 8  | w_cols_lftovr << 0;
  left_params  |= tot_stores    << 16 | x_rows_sub    << 15 | x_cols_sub    << 14 | w_cols_sub    << 13;
  x_d1_stride   = ((4*FPFORMAT)/ADDR_WIDTH)*(((DATA_WIDTH/FPFORMAT)*x_cols_iter_tmp) + x_cols_lftovr);
  x_rows_offs   = ARRAY_WIDTH*x_d1_stride;
  w_tot_len     = w_rows_iter*w_cols_iter*x_rows_iter;
  w_d0_stride   = ((4*FPFORMAT)/ADDR_WIDTH)*(((DATA_WIDTH/FPFORMAT)*w_cols_iter_tmp) + w_cols_lftovr);
  yz_tot_len    = ARRAY_WIDTH*x_rows_iter*w_cols_iter;
  yz_d0_stride  = w_d0_stride;
  yz_d2_stride  = ARRAY_WIDTH*w_d0_stride;
  tot_x_read    = x_rows_iter*x_cols_iter*w_cols_iter;

  // Writing the computations in configuration register
  REDMULE_WRITE_REG(REDMULE_REG_X_ITER_PTR        , x_iters        );
  REDMULE_WRITE_REG(REDMULE_REG_W_ITER_PTR        , w_iters        );
  REDMULE_WRITE_REG(REDMULE_REG_LEFTOVERS_PTR     , leftovers      );
  REDMULE_WRITE_REG(REDMULE_REG_LEFT_PARAMS_PTR   , left_params    );
  REDMULE_WRITE_REG(REDMULE_REG_X_D1_STRIDE_PTR   , x_d1_stride    );
  REDMULE_WRITE_REG(REDMULE_REG_X_ROWS_OFFS_PTR   , x_rows_offs    );
  REDMULE_WRITE_REG(REDMULE_REG_TOT_X_READ_PTR    , tot_x_read     );
  REDMULE_WRITE_REG(REDMULE_REG_X_BUFFER_SLOTS_PTR, x_buffer_slots );
  REDMULE_WRITE_REG(REDMULE_REG_W_TOT_LEN_PTR     , w_tot_len      );
  REDMULE_WRITE_REG(REDMULE_REG_W_D0_STRIDE_PTR   , w_d0_stride    );
  REDMULE_WRITE_REG(REDMULE_REG_YZ_TOT_LEN_PTR    , yz_tot_len     );
  REDMULE_WRITE_REG(REDMULE_REG_YZ_D0_STRIDE_PTR  , yz_d0_stride   );
  REDMULE_WRITE_REG(REDMULE_REG_YZ_D2_STRIDE_PTR  , yz_d2_stride   );
  REDMULE_WRITE_REG(REDMULE_REG_OP_SELECTION      , op_selection   );

  uint32_t x_iters_read;
  uint32_t w_iters_read;
  uint32_t leftovers_read;
  uint32_t left_params_read;
  uint32_t x_d1_stride_read;
  uint32_t x_rows_offs_read;
  uint32_t tot_x_read_read;
  uint32_t x_buffer_slots_read;
  uint32_t w_tot_len_read;
  uint32_t w_d0_stride_read;
  uint32_t yz_tot_len_read;
  uint32_t yz_d0_stride_read;
  uint32_t yz_d2_stride_read;
  uint32_t op_selection_read;

  if (check_writes) {
  REDMULE_READ_REG(x_iters_read,        REDMULE_REG_X_ITER_PTR          );
  REDMULE_READ_REG(w_iters_read,        REDMULE_REG_W_ITER_PTR          );
  REDMULE_READ_REG(leftovers_read,      REDMULE_REG_LEFTOVERS_PTR       );
  REDMULE_READ_REG(left_params_read,    REDMULE_REG_LEFT_PARAMS_PTR     );
  REDMULE_READ_REG(x_d1_stride_read,    REDMULE_REG_X_D1_STRIDE_PTR     );
  REDMULE_READ_REG(x_rows_offs_read,    REDMULE_REG_X_ROWS_OFFS_PTR     );
  REDMULE_READ_REG(tot_x_read_read,     REDMULE_REG_TOT_X_READ_PTR      );
  REDMULE_READ_REG(x_buffer_slots_read, REDMULE_REG_X_BUFFER_SLOTS_PTR  );
  REDMULE_READ_REG(w_tot_len_read,      REDMULE_REG_W_TOT_LEN_PTR       );
  REDMULE_READ_REG(w_d0_stride_read,    REDMULE_REG_W_D0_STRIDE_PTR     );
  REDMULE_READ_REG(yz_tot_len_read,     REDMULE_REG_YZ_TOT_LEN_PTR      );
  REDMULE_READ_REG(yz_d0_stride_read,   REDMULE_REG_YZ_D0_STRIDE_PTR    );
  REDMULE_READ_REG(yz_d2_stride_read,   REDMULE_REG_YZ_D2_STRIDE_PTR    );
  REDMULE_READ_REG(op_selection_read,   REDMULE_REG_OP_SELECTION        );

  #ifdef VERBOSE
  printf("x_iters_read: %d; expected: %d \n", x_iters_read, x_iters);
  printf("w_iters_read: %d; expected: %d \n", w_iters_read, w_iters);
  printf("leftovers_read: %d; expected: %d \n", leftovers_read, leftovers);
  printf("left_params_read: %d; expected: %d \n", left_params_read, left_params);
  printf("x_d1_stride_read: %d; expected: %d \n", x_d1_stride_read, x_d1_stride);
  printf("x_rows_offs_read: %d; expected: %d \n", x_rows_offs_read, x_rows_offs);
  printf("tot_x_read_read: %d; expected: %d \n", tot_x_read_read, tot_x_read);
  printf("x_buffer_slots_read: %d; expected: %d \n", x_buffer_slots_read, x_buffer_slots);
  printf("w_tot_len_read: %d; expected: %d \n", w_tot_len_read, w_tot_len);
  printf("w_d0_stride_read: %d; expected: %d \n", w_d0_stride_read, w_d0_stride);
  printf("yz_tot_len_read: %d; expected: %d \n", yz_tot_len_read, yz_tot_len);
  printf("yz_d0_stride_read: %d; expected: %d \n", yz_d0_stride_read, yz_d0_stride);
  printf("yz_d2_stride_read: %d; expected: %d \n", yz_d2_stride_read, yz_d2_stride);
  printf("op_selection_read: %d; expected: %d \n", op_selection_read, op_selection);
  #endif

  }
}

void redmule_cfg_test(){
  // Writing the computations in configuration register
  REDMULE_WRITE_REG(REDMULE_REG_X_ITER_PTR        , 0x12345678 );
  REDMULE_WRITE_REG(REDMULE_REG_W_ITER_PTR        , 0x12345678 );
  REDMULE_WRITE_REG(REDMULE_REG_LEFTOVERS_PTR     , 0x12345678 );
  REDMULE_WRITE_REG(REDMULE_REG_LEFT_PARAMS_PTR   , 0x12345678 );
  REDMULE_WRITE_REG(REDMULE_REG_X_D1_STRIDE_PTR   , 0x12345678 );
  REDMULE_WRITE_REG(REDMULE_REG_X_ROWS_OFFS_PTR   , 0x12345678 );
  REDMULE_WRITE_REG(REDMULE_REG_TOT_X_READ_PTR    , 0x12345678 );
  REDMULE_WRITE_REG(REDMULE_REG_X_BUFFER_SLOTS_PTR, 0x12345678 );
  REDMULE_WRITE_REG(REDMULE_REG_W_TOT_LEN_PTR     , 0x12345678 );
  REDMULE_WRITE_REG(REDMULE_REG_W_D0_STRIDE_PTR   , 0x12345678 );
  REDMULE_WRITE_REG(REDMULE_REG_YZ_TOT_LEN_PTR    , 0x12345678 );
  REDMULE_WRITE_REG(REDMULE_REG_YZ_D0_STRIDE_PTR  , 0x12345678 );
  REDMULE_WRITE_REG(REDMULE_REG_YZ_D2_STRIDE_PTR  , 0x12345678 );
  REDMULE_WRITE_REG(REDMULE_REG_OP_SELECTION      , 0x12345678 );

  uint32_t x_iters_read;
  uint32_t w_iters_read;
  uint32_t leftovers_read;
  uint32_t left_params_read;
  uint32_t x_d1_stride_read;
  uint32_t x_rows_offs_read;
  uint32_t tot_x_read_read;
  uint32_t x_buffer_slots_read;
  uint32_t w_tot_len_read;
  uint32_t w_d0_stride_read;
  uint32_t yz_tot_len_read;
  uint32_t yz_d0_stride_read;
  uint32_t yz_d2_stride_read;
  uint32_t op_selection_read;

  REDMULE_READ_REG(x_iters_read,        REDMULE_REG_X_ITER_PTR          );
  REDMULE_READ_REG(w_iters_read,        REDMULE_REG_W_ITER_PTR          );
  REDMULE_READ_REG(leftovers_read,      REDMULE_REG_LEFTOVERS_PTR       );
  REDMULE_READ_REG(left_params_read,    REDMULE_REG_LEFT_PARAMS_PTR     );
  REDMULE_READ_REG(x_d1_stride_read,    REDMULE_REG_X_D1_STRIDE_PTR     );
  REDMULE_READ_REG(x_rows_offs_read,    REDMULE_REG_X_ROWS_OFFS_PTR     );
  REDMULE_READ_REG(tot_x_read_read,     REDMULE_REG_TOT_X_READ_PTR      );
  REDMULE_READ_REG(x_buffer_slots_read, REDMULE_REG_X_BUFFER_SLOTS_PTR  );
  REDMULE_READ_REG(w_tot_len_read,      REDMULE_REG_W_TOT_LEN_PTR       );
  REDMULE_READ_REG(w_d0_stride_read,    REDMULE_REG_W_D0_STRIDE_PTR     );
  REDMULE_READ_REG(yz_tot_len_read,     REDMULE_REG_YZ_TOT_LEN_PTR      );
  REDMULE_READ_REG(yz_d0_stride_read,   REDMULE_REG_YZ_D0_STRIDE_PTR    );
  REDMULE_READ_REG(yz_d2_stride_read,   REDMULE_REG_YZ_D2_STRIDE_PTR    );
  REDMULE_READ_REG(op_selection_read,   REDMULE_REG_OP_SELECTION        );

  printf("x_iters_read: %X; expected: %X \n", x_iters_read, 0x12345678);
  printf("w_iters_read: %X; expected: %X \n", w_iters_read, 0x12345678);
  printf("leftovers_read: %X; expected: %X \n", leftovers_read, 0x12345678);
  printf("left_params_read: %X; expected: %X \n", left_params_read, 0x12345678);
  printf("x_d1_stride_read: %X; expected: %X \n", x_d1_stride_read, 0x12345678);
  printf("x_rows_offs_read: %X; expected: %X \n", x_rows_offs_read, 0x12345678);
  printf("tot_x_read_read: %X; expected: %X \n", tot_x_read_read, 0x12345678);
  printf("x_buffer_slots_read: %X; expected: %X \n", x_buffer_slots_read, 0x12345678);
  printf("w_tot_len_read: %X; expected: %X \n", w_tot_len_read, 0x12345678);
  printf("w_d0_stride_read: %X; expected: %X \n", w_d0_stride_read, 0x12345678);
  printf("yz_tot_len_read: %X; expected: %X \n", yz_tot_len_read, 0x12345678);
  printf("yz_d0_stride_read: %X; expected: %X \n", yz_d0_stride_read, 0x12345678);
  printf("yz_d2_stride_read: %X; expected: %X \n", yz_d2_stride_read, 0x12345678);
  printf("op_selection_read: %X; expected: %X \n", op_selection_read, 0x12345678);


}
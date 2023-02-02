// Copyright 2020 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0


#include <stdint.h>
#include "stdio.h"
#include "printf.h"

#include "snrt.h"

#include "hwpe_snitch_redmule_hal.h"

// #define VERBOSE

int main()
{

  const uint32_t cluster_num = snrt_cluster_num();
  const uint32_t cluster_id = snrt_cluster_idx();
  const uint32_t compute_num = snrt_cluster_compute_core_num();
  const uint32_t compute_id = snrt_cluster_compute_core_idx();

  // Declarations
  int err = 0;
  uint16_t m_size   = M_SIZE;
  uint16_t n_size   = N_SIZE;
  uint16_t k_size   = K_SIZE;

  uint16_t x_dim = m_size*n_size;
  uint16_t w_dim = n_size*k_size;
  uint16_t y_dim = m_size*k_size;
  uint16_t z_dim = m_size*k_size;
  uint32_t n_ops = m_size*n_size*k_size;
  uint8_t  ratio = ADDR_WIDTH/FPFORMAT;
  
  // allocate memory
  void *ptr;
  uint32_t total_size = ratio * ( x_dim + w_dim + y_dim + z_dim);
  
  if (compute_id == 0) {
      ptr = snrt_l1alloc(total_size);
  }
  uint8_t volatile *x = ptr;
  uint8_t volatile *w = ptr + ratio*x_dim;
  uint8_t volatile *y = ptr + ratio*x_dim + ratio*w_dim;
  uint8_t volatile *z = ptr + ratio*x_dim + ratio*w_dim + ratio*y_dim;
  
  snrt_cluster_hw_barrier();

  // if (compute_id==0) {
  //   // // silly init temporary
  //   uint8_t seed = 0x00;
  //   for (int i=0; i<ratio*x_dim; i++) {
  //     seed += 0x01;
  //     x[i] = seed;
  //   }
  //   seed = 0x00;
  //   for (int i=0; i<ratio*w_dim; i++) {
  //     seed += 0x01;
  //     w[i]=seed;
  //   }
  //   seed = 0x00;
  //   for (int i=0; i<ratio*y_dim; i++) {
  //     seed += 0x01;
  //     y[i]=seed;
  //   }
  //   seed = 0x00;
  //   for (int i=0; i<ratio*z_dim; i++) {
  //     seed += 0x01;
  //     z[i]= seed;
  //   }
  // }

  snrt_cluster_hw_barrier();

    // Enable clock
    //hwpe_clock_enable();

    // setup HCI -- NOT SUPPORTED IN SNITCH CLUSTER
    // REDMULE_SETPRIORITY_REDMULE(); // priority to REDMULE w.r.t. cores, DMA
    // REDMULE_RESET_MAXSTALL();  // reset maximum stall
    // REDMULE_SET_MAXSTALL(8);   // set maximum consecutive stall to 8 cycles for cores, DMA side
  
  if (snrt_is_compute_core() && compute_id == 0) {

    // generate test data
    generate_test_data((int) &x[0], (int) &w[0], (int) &y[0], (int) x_dim, (int) w_dim, (int) y_dim, ratio);

    // soft-clear REDMULE
    hwpe_soft_clear();

    // acquire job
    acquire_job();

    // set pointers
    hwpe_cfg_mem_pointers(x, w, y, z );
    
    // config REDMULE
    redmule_cfg (m_size, n_size, k_size, 'GEMM', 0);

    // Trigger FSM (REDMULE starts computation)
    hwpe_start_execution();

    // Poll on REDMULE's status reg
    hwpe_eoc_polling();

    // // disable clock
    // REDMULE_CG_DISABLE();

    // // compare results
    // err = compare_golden( (int) z, (int) z_dim, n_ops, ratio );

    // // check
    // if (err!=0)
    //   printf("Failed. Exit with %d errors. \n", err);
    // else
    //   printf("Success. Exit with %d errors. \n", err);
  }

  // snitch hardware barrier
  snrt_cluster_hw_barrier();

  // exit code
  return 0;

}

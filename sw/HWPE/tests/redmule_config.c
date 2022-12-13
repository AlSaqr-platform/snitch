// Copyright 2020 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "printf.h"
#include "snrt.h"
#include <stdint.h>
#include <hwpe_snitch_redmule_hal.h>
#include <tensor_dim.h>

// HWPE address
// 48'h 0000 0014 0000
// 48'h 0000 0014 0400

int main() {       

       int volatile hwpe_status = 0;
       int volatile random_reg_write_val = 0xa5;
       int volatile random_reg_read_back = 10;
       uint32_t core_idx = snrt_global_core_idx();
       uint32_t core_num = snrt_global_core_num();

       if (core_idx==0) {
              redmule_cfg_test();
       }

       return 0;
}

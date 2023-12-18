import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge, Timer

import numpy as np


@cocotb.test()
async def nco_tb(dut):
    cocotb.start_soon(Clock(dut.clk, 1, units="ns").start())

    dut.step.value = 10

    dut.rst.value = 1
    await Timer(100, units="ns")
    dut.rst.value = 0

    sin_log = np.zeros(10000, dtype=np.int64)
    for i in range(len(sin_log)):
        await FallingEdge(dut.clk)
        if 'x' not in dut.out.value.binstr and 'z' not in dut.out.value.binstr:
            sin_log[i] = dut.out.value.signed_integer

    print(sin_log)
    sin_log.tofile('sine.dat')
    return

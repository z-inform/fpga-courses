import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge, Timer

import numpy as np
import matplotlib.pyplot as plt


@cocotb.test()
async def nco_tb(dut):
    cocotb.start_soon(Clock(dut.clk, 1, units="ns").start())

    steps = [1000, 10000, 30000, 60000]

    for step in steps:
        dut.step.value = step

        dut.rst.value = 1
        await Timer(100, units="ns")
        dut.rst.value = 0

        sin_log = np.zeros(100000, dtype=np.int64)
        for i in range(len(sin_log)):
            await FallingEdge(dut.clk)
            if 'x' not in dut.out.value.binstr and 'z' not in dut.out.value.binstr:
                sin_log[i] = dut.out.value.signed_integer

        spec = np.fft.fftshift(np.fft.fft(sin_log))
        plt.plot(np.log10(np.abs(spec)))
        plt.savefig(f'spec{step}.png')
        plt.close()

    return

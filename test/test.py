import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test_fulladder(dut):
    dut._log.info("Starting Full Adder Test")

    # Test all combinations of a, b, cin
    for a in range(2):
        for b in range(2):
            for cin in range(2):
                
                # Apply inputs on ui_in[0], ui_in[1], ui_in[2]
                dut.ui_in.value = (cin << 2) | (b << 1) | a
                
                # Wait for signals to settle
                await Timer(1, units="ns")
                
                # Expected values
                total = a + b + cin
                expected_sum = total & 1
                expected_carry = (total >> 1) & 1
                
                # Read outputs
                actual_sum = int(dut.uo_out.value[0])
                actual_carry = int(dut.uo_out.value[1])
                
                dut._log.info(
                    f"a={a}, b={b}, cin={cin} => "
                    f"sum={actual_sum}, carry={actual_carry}"
                )
                
                # Assertions
                assert actual_sum == expected_sum, \
                    f"SUM mismatch: a={a}, b={b}, cin={cin}"
                
                assert actual_carry == expected_carry, \
                    f"CARRY mismatch: a={a}, b={b}, cin={cin}"

    dut._log.info("Full Adder Test Passed Successfully")

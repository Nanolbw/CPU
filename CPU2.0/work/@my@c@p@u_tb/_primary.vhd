library verilog;
use verilog.vl_types.all;
entity MyCPU_tb is
    generic(
        CYCLE           : integer := 32
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CYCLE : constant is 1;
end MyCPU_tb;

library verilog;
use verilog.vl_types.all;
entity pc is
    port(
        stop            : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pcJMP           : in     vl_logic;
        banEBL          : in     vl_logic;
        ban             : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        pc              : out    vl_logic_vector(7 downto 0)
    );
end pc;

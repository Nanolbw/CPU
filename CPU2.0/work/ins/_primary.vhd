library verilog;
use verilog.vl_types.all;
entity ins is
    port(
        outins          : out    vl_logic_vector(15 downto 0);
        adder           : in     vl_logic_vector(7 downto 0);
        r1              : out    vl_logic_vector(5 downto 0);
        r2              : out    vl_logic_vector(7 downto 0);
        clk             : in     vl_logic
    );
end ins;

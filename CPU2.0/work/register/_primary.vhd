library verilog;
use verilog.vl_types.all;
entity \register\ is
    port(
        RA              : in     vl_logic_vector(2 downto 0);
        RB              : in     vl_logic_vector(2 downto 0);
        RW              : in     vl_logic_vector(2 downto 0);
        busW            : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        WE              : in     vl_logic;
        busA            : out    vl_logic_vector(15 downto 0);
        busB            : out    vl_logic_vector(15 downto 0);
        RD              : in     vl_logic
    );
end \register\;

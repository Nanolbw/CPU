library verilog;
use verilog.vl_types.all;
entity acc is
    port(
        ena             : in     vl_logic;
        accop           : in     vl_logic_vector(1 downto 0);
        accin           : in     vl_logic_vector(15 downto 0);
        acc             : out    vl_logic_vector(15 downto 0)
    );
end acc;

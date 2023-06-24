library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        outalu          : out    vl_logic_vector(15 downto 0);
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        \select\        : in     vl_logic_vector(2 downto 0)
    );
end alu;

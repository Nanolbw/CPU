library verilog;
use verilog.vl_types.all;
entity cu is
    port(
        accout          : in     vl_logic_vector(7 downto 0);
        outins          : in     vl_logic_vector(15 downto 0);
        stop            : out    vl_logic;
        accop           : out    vl_logic_vector(1 downto 0);
        ena             : out    vl_logic;
        aluop           : out    vl_logic_vector(2 downto 0);
        enable          : out    vl_logic;
        pcJMP           : out    vl_logic;
        banEBL          : out    vl_logic;
        ban             : out    vl_logic
    );
end cu;

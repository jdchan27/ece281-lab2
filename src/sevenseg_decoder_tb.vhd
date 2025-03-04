--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  
entity sevenseg_decoder_tb is --notice entity is empty.  The testbench has no external connections.
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is 
	
  -- declare the component of your top-level design unit under test (UUT) (looks very similar to entity declaration)
  component sevenseg_decoder is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end component;

  -- declare any additional components required
  
  signal w_Hex : std_logic_vector (3 downto 0):= (others=> '0');
  signal w_o : std_logic_vector (6 downto 0):= (others=> '0');

  
begin
	-- PORT MAPS ----------------------------------------
	-- map ports for any component instances (port mapping is like wiring hardware)
    sevenseg_decoder_inst : sevenseg_decoder port map (
			i_Hex(3) => w_Hex(3),
			i_Hex(2) => w_Hex(2),
			i_Hex(1) => w_Hex(1),
			i_Hex(0) => w_Hex(0),
			o_seg_n(6) => w_o(6),
			o_seg_n(5) => w_o(5),
			o_seg_n(4) => w_o(4),
			o_seg_n(3) => w_o(3),
			o_seg_n(2) => w_o(2),
			o_seg_n(1) => w_o(1),
			o_seg_n(0) => w_o(0)
        );
	-----------------------------------------------------

	-- PROCESSES ----------------------------------------	
	-- Test Plan Process --------------------------------
	-- Implement the test plan here.  Body of process is continuous from time = 0  
	test_process : process 
	begin
	-- Place test cases here. The first two have been written for you
		w_Hex <= x"0"; wait for 10 ns;
            assert w_o = "1000000" report "error on x0" severity failure;
        w_Hex <= x"1"; wait for 10 ns;
            assert w_o = "1111001" report "error on x1" severity failure;
        w_Hex <= x"2"; wait for 10 ns;
            assert w_o = "0100100" report "error on x2" severity failure;
        w_Hex <= x"3"; wait for 10 ns;
            assert w_o = "0110000" report "error on x3" severity failure;
        w_Hex <= x"4"; wait for 10 ns;
            assert w_o = "0011001" report "error on x4" severity failure;
        w_Hex <= x"5"; wait for 10 ns;
            assert w_o = "0010010" report "error on x5" severity failure;
        w_Hex <= x"6"; wait for 10 ns;
            assert w_o = "0000010" report "error on x6" severity failure;
        w_Hex <= x"7"; wait for 10 ns;
            assert w_o = "1111000" report "error on x7" severity failure;
        w_Hex <= x"8"; wait for 10 ns;
            assert w_o = "0000000" report "error on x8" severity failure;
        w_Hex <= x"9"; wait for 10 ns;
            assert w_o = "0011000" report "error on x9" severity failure;
        w_Hex <= x"A"; wait for 10 ns;
            assert w_o = "0001000" report "error on xA" severity failure;
        w_Hex <= x"B"; wait for 10 ns;
            assert w_o = "0000011" report "error on xB" severity failure;
        w_Hex <= x"C"; wait for 10 ns;
            assert w_o = "0100111" report "error on xC" severity failure;
        w_Hex <= x"D"; wait for 10 ns;
            assert w_o = "0100001" report "error on xD" severity failure;
        w_Hex <= x"E"; wait for 10 ns;
            assert w_o = "0000110" report "error on xE" severity failure;
        w_Hex <= x"F"; wait for 10 ns;
            assert w_o = "0001110" report "error on xF" severity failure;
            
            
            
            

		wait; -- wait forever
	end process;	
	-----------------------------------------------------	
	
end test_bench;

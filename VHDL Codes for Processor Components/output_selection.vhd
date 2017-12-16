library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.main_parameters.all;
entity output_selection is
port (
  A, reg: in std_logic_vector(m-1 downto 0);
  clk, out_en, out_sel: in std_logic;
  i: in std_logic_vector(2 downto 0);
  OUT0, OUT1, OUT2, OUT3, OUT4, OUT5, OUT6, OUT7: out std_logic_vector(m-1 downto 0)  
);
end output_selection;

architecture structure of output_selection is

  signal EN: std_logic_vector(0 to 7);
  signal DEC_OUT: std_logic_vector(0 to 7); 
  signal to_ports: std_logic_vector(m-1 downto 0);
  
begin

  decoder: process(i)
  begin
    case i is 
	   when "000" => DEC_OUT <= "10000000"; 
	   when "001" => DEC_OUT <= "01000000"; 
	   when "010" => DEC_OUT <= "00100000"; 
	   when "011" => DEC_OUT <= "00010000"; 
	   when "100" => DEC_OUT <= "00001000"; 
	   when "101" => DEC_OUT <= "00000100"; 
	   when "110" => DEC_OUT <= "00000010"; 
	   when others => DEC_OUT <= "00000001"; 
     end case;
	end process;

   and_gate: process(DEC_OUT, out_en)
	begin
	  for i in 0 to 7 loop EN(i) <= DEC_OUT(i) AND out_en; end loop;
	end process;  

   multiplexor: process(out_sel, A, reg)
	begin
	  if out_sel = '0' then to_ports <= A;
	  else to_ports <= reg;
	  end if;
	end process;

   output_registers: process(clk)
   begin
     if clk'event and clk = '1' then
        case EN is
		     when "10000000" => OUT0 <= to_ports;
		     when "01000000" => OUT1 <= to_ports;
		     when "00100000" => OUT2 <= to_ports;
		     when "00010000" => OUT3 <= to_ports;
		     when "00001000" => OUT4 <= to_ports;
		     when "00000100" => OUT5 <= to_ports;
		     when "00000010" => OUT6 <= to_ports;
		     when "00000001" => OUT7 <= to_ports;
			  when others => null;
		 end case;
	  end if;
    end process;

end structure;

	 
--library ieee; 
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--use work.main_parameters.all;
--entity test_output_selection is end test_output_selection;
--
--architecture test of test_output_selection is
--
--component output_selection is
--port (
--  A, reg: in std_logic_vector(m-1 downto 0);
--  clk, out_en, out_sel: in std_logic;
--  i: in std_logic_vector(2 downto 0);
--  OUT0, OUT1, OUT2, OUT3, OUT4, OUT5, OUT6, OUT7: out std_logic_vector(m-1 downto 0)  
--);
--end component;
--
--signal A, reg: std_logic_vector(m-1 downto 0);
--signal clk: std_logic := '0';
--signal out_en, out_sel: std_logic;
--signal i: std_logic_vector(2 downto 0);
--signal OUT0, OUT1, OUT2, OUT3, OUT4, OUT5, OUT6, OUT7: std_logic_vector(m-1 downto 0);
--
--begin
--
--dut: output_selection
--port map(A => A, reg => reg, clk => clk, out_en => out_en, out_sel => out_sel, i => i,
--  OUT0 => OUT0, OUT1 => OUT1, OUT2 => OUT2, OUT3 => OUT3, OUT4 => OUT4, OUT5 => OUT5, OUT6 => OUT6, OUT7 => OUT7);
--
--clk <= not(clk) after 10 ns;
--
--A <= "00001111";
--
--reg <= "11110000";
--
--process
--begin
--
--out_en <= '1';
--out_sel <= '0';
--i <= "000";
--for j in 0 to 7 loop
--  wait for 100 ns;
--  i <= i + "001";
--end loop;
--
--out_en <= '0';
--out_sel <= '0';
--i <= "000";
--for j in 0 to 7 loop
--  wait for 100 ns;
--  i <= i + "001";
--end loop;
--
--out_en <= '1';
--out_sel <= '1';
--for j in 0 to 7 loop
--  wait for 100 ns;
--  i <= i + "001";
--end loop;
--
--out_en <= '0';
--out_sel <= '1';
--for j in 0 to 7 loop
--  wait for 100 ns;
--  i <= i + "001";
--end loop;
--
--end process;
--
--end test;
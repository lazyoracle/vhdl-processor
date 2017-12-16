library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.main_parameters.all;
entity go_to is
port (
  N, data: in std_logic_vector(m-1 downto 0);
  clk, reset: in std_logic;
  numb_sel: in std_logic_vector(3 downto 0);
  number: inout std_logic_vector(m-1 downto 0)  
);
end go_to;

architecture structure of go_to is

  signal pos, neg, load: std_logic;
  
begin

   sign_computation: process(data)
	begin
	  if data(m-1) = '1' then pos <= '0'; neg <= '1';
	  elsif data = zero then pos <= '0'; neg <= '0';
	  else pos <= '1'; neg <= '0';
	  end if;
	end process;
	
	load_condition: process(numb_sel, pos, neg)
	begin
	  case numb_sel is
	    when "1110" => load <= '1';
	    when "1100" => load <= pos;
 	    when "1101" => load <= neg;
	    when others => load <= '0';
	  end case;
	end process;
	
	programmable_counter: process(clk, reset)
   begin
      if reset = '1' then number <= zero;
      elsif clk'event and clk = '1' then
        if load = '1' then number <= N;
        else number <= number + 1;
        end if;
      end if;
   end process;
end structure;


	 
--library ieee; 
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--use work.main_parameters.all;
--entity test_go_to is end test_go_to;
--
--architecture test of test_go_to is
--
--component go_to is
--port (
--  N, data: in std_logic_vector(m-1 downto 0);
--  clk, reset: in std_logic;
--  numb_sel: in std_logic_vector(1 downto 0);
--  number: inout std_logic_vector(m-1 downto 0)  
--);
--end component;
--
--signal N, data: std_logic_vector(m-1 downto 0);
--signal clk: std_logic := '0';
--signal reset: std_logic;
--signal numb_sel: std_logic_vector(1 downto 0);
--signal number: std_logic_vector(m-1 downto 0);
--
--begin
--
--dut: go_to
--port map(N => N, data => data, clk => clk, reset => reset, numb_sel => numb_sel, number => number);
--
--clk <= not(clk) after 10 ns;
--
--process
--begin
--
--  N <= "11111100";
--  data <= "00000001";
--  numb_sel <= "11";
--  reset <= '1';
--  wait for 20 ns;
--  reset <= '0';
--  wait for 100 ns;
--  numb_sel <= "01";
--  wait for 20 ns;
--  numb_sel <= "11";
--  wait for 100 ns;
--  data <= "10000000";
--  numb_sel <= "10";
--  wait for 20 ns;
--  numb_sel <= "11";
--  wait for 100 ns;
--  data <= "00000000";
--  numb_sel <= "10";
--  wait for 20 ns;
--  numb_sel <= "00";
--  wait for 20 ns;
--  numb_sel <= "11";
--  
--  wait;
--  
--end process;
--
--end test;  
--    
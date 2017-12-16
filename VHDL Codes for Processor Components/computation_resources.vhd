library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.main_parameters.all;
entity computation_resources is
port (
  left_in, right_in: in std_logic_vector(m-1 downto 0);
  operation: in std_logic;
  result: out std_logic_vector(m-1 downto 0)
);
end computation_resources;

architecture behavior of computation_resources is
begin
  process(operation, left_in, right_in)
  begin
    if operation = '0' then result <= left_in + right_in;
	 else result <= left_in - right_in;
	 end if;
  end process;
end behavior;

--library ieee; 
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--use work.main_parameters.all;
--entity test_computation_resources is end test_computation_resources;
--
--architecture test of test_computation_resources is
--
--component computation_resources is
--port (
--  left_in, right_in: in std_logic_vector(m-1 downto 0);
--  operation: in std_logic;
--  result: out std_logic_vector(m-1 downto 0)
--);
--end component;
--  
--signal left_in, right_in: std_logic_vector(m-1 downto 0);
--signal operation: std_logic;
--signal result: std_logic_vector(m-1 downto 0);
--
--begin
--
--dut: computation_resources
--port map (left_in => left_in, right_in => right_in, operation => operation, result => result);
--
--process
--begin
--  left_in <= "01101011";
--  right_in <= "00101101";
--  operation <= '0';
--  wait for 10 ns;
--  operation <= '1';
--  wait for 10 ns;
--  left_in <= "00000000";
--  right_in <= "00000001";
--  wait for 10 ns;
--  left_in <= "11111111";
--  right_in <= "00000001";
--  operation <= '0';
--  wait;
--end process;
--
--end test;  
--  
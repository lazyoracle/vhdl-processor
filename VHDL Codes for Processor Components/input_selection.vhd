library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
package main_parameters is
  constant m: natural := 8; -- m-bit processor
  constant zero: std_logic_vector(m-1 downto 0) := conv_std_logic_vector(0, m);
end main_parameters;

library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.main_parameters.all;
entity input_selection is
port (
  IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7: in std_logic_vector(m-1 downto 0);
  A, result: in std_logic_vector(m-1 downto 0);
  j: in std_logic_vector(2 downto 0);
  input_control: in std_logic_vector(1 downto 0);
  to_reg: out std_logic_vector(m-1 downto 0)
);
end input_selection;

architecture structure of input_selection is
   signal selected_port: std_logic_vector(m-1 downto 0);
begin

  first_mux: process(j, IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7)
  begin
    case j is
	   when "000" => selected_port <= IN0;
	   when "001" => selected_port <= IN1;
	   when "010" => selected_port <= IN2;
	   when "011" => selected_port <= IN3;
	   when "100" => selected_port <= IN4;
	   when "101" => selected_port <= IN5;
	   when "110" => selected_port <= IN6;
	   when others => selected_port <= IN7;
    end case;
  end process;

  second_mux: process(input_control, A, selected_port, result)
  begin
    case input_control is
      when "00" => to_reg <= A;
      when "01" => to_reg <= selected_port;
      when "10" => to_reg <= result;
      when others => to_reg <= (others => '0');
	  end case;
	end process;

end structure;
	 
		
--library ieee; 
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--use work.main_parameters.all;
--entity test_input_selection is end test_input_selection;
--
--architecture test of test_input_selection is
--
--component input_selection is
--port (
--  IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7: in std_logic_vector(m-1 downto 0);
--  A, result: in std_logic_vector(m-1 downto 0);
--  j: in std_logic_vector(2 downto 0);
--  input_control: in std_logic_vector(1 downto 0);
--  to_reg: out std_logic_vector(m-1 downto 0)
--);
--end component;
--
--signal IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7: std_logic_vector(m-1 downto 0);
--signal A, result: std_logic_vector(m-1 downto 0);
--signal j: std_logic_vector(2 downto 0);
--signal input_control: std_logic_vector(1 downto 0);
--signal to_reg: std_logic_vector(m-1 downto 0);
--
--begin
--
--dut: input_selection
--port map (IN0 => IN0, IN1 => IN1, IN2 => IN2, IN3 => IN3, IN4 => IN4, IN5 => IN5, IN6 => IN6, IN7 => IN7, 
--A => A, result => result, j => j, input_control => input_control, to_reg => to_reg);
--
--IN0 <= "00000001";
--IN1 <= "00000010";
--IN2 <= "00000100";
--IN3 <= "00001000";
--IN4 <= "00010000";
--IN5 <= "00100000";
--IN6 <= "01000000";
--IN7 <= "10000000";
--A <= "00001111";
--result <= "11110000";
--
--process
--begin
--  input_control <= "01";
--  j <= "000";
--  for i in 0 to 7 loop
--  wait for 10 ns;
--  j <= j + "001";
--  end loop;
--  input_control <= "00";
--  wait for 10 ns;
--  input_control <= "10";
--  wait for 10 ns;
--  input_control <= "11";
--  wait;
--end process;
--
--end test;
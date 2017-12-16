--
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
package main_parameters2 is
 constant m: natural := 8; -- m-bit processor
 constant zero: std_logic_vector(m-1 downto 0) := conv_std_logic_vector(0, m);
 constant one: std_logic_vector(m-1 downto 0) := conv_std_logic_vector(1, m);  
 constant ASSIGN_VALUE: std_logic_vector(3 downto 0) := "0000";
 constant DATA_INPUT: std_logic_vector(3 downto 0) := "0010";
 constant DATA_OUTPUT: std_logic_vector(3 downto 0) := "1010";
 constant OUTPUT_VALUE: std_logic_vector(3 downto 0) := "1000";
 constant OPERATION_ADD: std_logic_vector(3 downto 0) := "0100";
 constant OPERATION_SUB: std_logic_vector(3 downto 0) := "0101";
 constant JUMP: std_logic_vector(3 downto 0) := "1110";
 constant JUMP_POS: std_logic_vector(3 downto 0) := "1100";
 constant JUMP_NEG: std_logic_vector(3 downto 0) := "1101";
end main_parameters2;




library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.main_parameters2.all;
package program3 is
type program_memory is array (0 to 255) of std_logic_vector(15 downto 0);
constant chronometer: program_memory := (
ASSIGN_VALUE & x"01" & x"3",
DATA_INPUT & "0000" & x"0" & x"0",
JUMP_POS & x"0" & x"06",
DATA_INPUT & "0000" & x"1" & x"0",
JUMP_POS & x"0" & x"09",
JUMP & "0000" & x"01",
ASSIGN_VALUE & x"00" & x"2",
DATA_OUTPUT & x"0" & x"2" & "0000",
JUMP & "0000" & x"01",
DATA_INPUT & "0000" & x"2" & x"0",
JUMP_POS & x"0" & x"01",

--DATA_INPUT & "0000" & x"3" & x"1",
--DATA_INPUT & "0000" & x"3" & x"0",
--OPERATION_SUB & x"0" & x"1" & x"0",
--JUMP_POS & x"0" & x"10",
--JUMP & "0000" & x"09",

DATA_INPUT & "0000" & x"3" & x"1",
JUMP_POS & x"1" & x"0B",
DATA_INPUT & "0000" & x"3" & x"1",
JUMP_POS & x"1" & x"10",
JUMP & "0000" & x"0D",

OPERATION_ADD & x"2" & x"3" & x"2",
DATA_OUTPUT & x"0" & x"2" & "0000",
JUMP & "0000" & x"09",
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000"

);
end program3;


library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.main_parameters2.all;
use work.program3.all;
entity test_processor3 is end test_processor3;

architecture test of test_processor3 is

component processor is
port (
  IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7: in std_logic_vector(m-1 downto 0);
	instruction: in std_logic_vector(15 downto 0);
	clk, reset: in std_logic;
  OUT0, OUT1, OUT2, OUT3, OUT4, OUT5, OUT6, OUT7: out std_logic_vector(m-1 downto 0);
  number: inout std_logic_vector(7 downto 0)  	
);
end component;

signal IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7: std_logic_vector(m-1 downto 0);
signal instruction: std_logic_vector(15 downto 0);
signal clk: std_logic := '0';
signal reset: std_logic;
signal OUT0, OUT1, OUT2, OUT3, OUT4, OUT5, OUT6, OUT7: std_logic_vector(m-1 downto 0);
signal number: std_logic_vector(7 downto 0);

signal time_reset, start, stop, current_time: std_logic_vector(m-1 downto 0);
signal ref: std_logic := '0';

begin

ref <= not(ref) after 100 ns;

process
begin
reset <= '1';
time_reset <= "00000000";
start <= "00000000";
stop <= "00000000";
wait for 100 ns;
reset <= '0';
time_reset <= "00000000";
start <= "00000000";
stop <= "00000000";
wait for 100 ns;
time_reset <= "00000001";
start <= "00000000";
stop <= "00000000";
wait for 200 ns;
time_reset <= "00000000";
start <= "00000000";
stop <= "00000000";
wait for 200 ns;
time_reset <= "00000000";
start <= "00000001";
stop <= "00000000";
wait for 400 ns;
time_reset <= "00000000";
start <= "00000000";
stop <= "00000000";
wait for 4000 ns;
time_reset <= "00000000";
start <= "00000000";
stop <= "00000001";
wait for 400 ns;
time_reset <= "00000000";
start <= "00000000";
stop <= "00000000";
wait for 1400 ns;
time_reset <= "00000001";
start <= "00000000";
stop <= "00000000";
wait for 200 ns;
time_reset <= "00000000";
start <= "00000000";
stop <= "00000000";
wait for 200 ns;
time_reset <= "00000000";
start <= "00000001";
stop <= "00000000";
wait for 400 ns;
time_reset <= "00000000";
start <= "00000000";
stop <= "00000000";
wait for 4000 ns;
time_reset <= "00000000";
start <= "00000000";
stop <= "00000001";
wait for 400 ns;
time_reset <= "00000000";
start <= "00000000";
stop <= "00000000";

wait;
end process;

clk <= not(clk) after 10 ns;

IN0 <= time_reset;
IN1 <= start;
IN2 <= stop;
IN3 <= "0000000" & ref;

current_time <= OUT0;

instruction <= chronometer(conv_integer(number));


dut: processor
port map(IN0 => IN0, IN1 => IN1, IN2 => IN2, IN3 => IN3, IN4 => IN4, IN5 => IN5, IN6 => IN6, IN7 => IN7, 
        instruction => instruction, clk => clk, reset => reset, 
        OUT0 => OUT0, OUT1 => OUT1, OUT2 => OUT2, OUT3 => OUT3, OUT4 => OUT4, OUT5 => OUT5, OUT6 => OUT6, OUT7 => OUT7,
        number => number);
			
end test;



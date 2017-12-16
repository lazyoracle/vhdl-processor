--temperature control program

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
package program is
-- encoding instructions
constant ASSIGN_VALUE: std_logic_vector(3 downto 0) := "0000";
constant DATA_INPUT: std_logic_vector(3 downto 0) := "0010";
constant DATA_OUTPUT: std_logic_vector(3 downto 0) := "1010";
constant OUTPUT_VALUE: std_logic_vector(3 downto 0) := "1000";
constant OPERATION_ADD: std_logic_vector(3 downto 0) := "0100";
constant OPERATION_SUB: std_logic_vector(3 downto 0) := "0101";
constant JUMP: std_logic_vector(3 downto 0) := "1110";
constant JUMP_POS: std_logic_vector(3 downto 0) := "1100";
constant JUMP_NEG: std_logic_vector(3 downto 0) := "1101";

type program_memory is array (0 to 255) of std_logic_vector(15 downto 0);

constant temperature_control: program_memory := (
-- sequence of instructions in program memory
ASSIGN_VALUE & x"0A" & x"5",
DATA_INPUT & "0000" & x"0" & x"0",
DATA_INPUT & "0000" & x"1" & x"1",
OPERATION_SUB & x"0" & x"1" & x"4",
JUMP_NEG & x"4" & x"07",
JUMP_POS & x"4" & x"09",
JUMP & "0000" & x"0A",
OUTPUT_VALUE & x"0" & x"01",
JUMP & "0000" & x"0A",
OUTPUT_VALUE & x"0" & x"00",
DATA_INPUT & "0000" & x"2" & x"3",
DATA_INPUT & "0000" & x"2" & x"2",
OPERATION_SUB & x"2" & x"3" & x"4",
OPERATION_SUB & x"4" & x"5" & x"4",
JUMP_NEG & x"4" & x"0B",
JUMP & "0000" & x"01",
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
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", 
x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000"

);

end program;

--test bench for temperature control program
library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.main_parameters.all;
use work.program.all;
entity test_processor is end test_processor;

architecture test of test_processor is

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

signal temp, pos: std_logic_vector(m-1 downto 0);
signal digital_clock: std_logic_vector(m-1 downto 0) := (others => '0');
signal onoff: std_logic;

begin

digital_clock <= digital_clock + "00000001" after 100 ns;

process
begin
reset <= '1';
pos <= x"14";
temp <= x"10";
wait for 110 ns;
reset <= '0';
wait for 2000 ns;
temp <= x"15";
wait for 2000 ns;
temp <= x"14";
wait for 2000 ns;
temp <= x"13";
wait;
end process;

clk <= not(clk) after 10 ns;

IN0 <= temp;
IN1 <= pos;
IN2 <= digital_clock;

onoff <= OUT0(0);

instruction <= temperature_control(conv_integer(number));


dut: processor
port map(IN0 => IN0, IN1 => IN1, IN2 => IN2, IN3 => IN3, IN4 => IN4, IN5 => IN5, IN6 => IN6, IN7 => IN7, 
        instruction => instruction, clk => clk, reset => reset, 
        OUT0 => OUT0, OUT1 => OUT1, OUT2 => OUT2, OUT3 => OUT3, OUT4 => OUT4, OUT5 => OUT5, OUT6 => OUT6, OUT7 => OUT7,
        number => number);
			
end test;
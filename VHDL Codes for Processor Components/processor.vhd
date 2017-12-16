library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.main_parameters.all;
entity processor is
port (
   IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7: in std_logic_vector(m-1 downto 0);
	instruction: in std_logic_vector(15 downto 0);
	clk, reset: in std_logic;
   OUT0, OUT1, OUT2, OUT3, OUT4, OUT5, OUT6, OUT7: out std_logic_vector(m-1 downto 0);
   number: inout std_logic_vector(7 downto 0)
);
end processor;

architecture structure of processor is

 signal write_reg, out_en: std_logic;
 signal result, reg_in, left_out, right_out: std_logic_vector(m-1 downto 0);

component input_selection is
port (
  IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7: in std_logic_vector(m-1 downto 0);
  A, result: in std_logic_vector(m-1 downto 0);
  j: in std_logic_vector(2 downto 0);
  input_control: in std_logic_vector(1 downto 0);
  to_reg: out std_logic_vector(m-1 downto 0)
);
end component;
 
component computation_resources is
port (
  left_in, right_in: in std_logic_vector(m-1 downto 0);
  operation: in std_logic;
  result: out std_logic_vector(m-1 downto 0)
);
end component;
 
component output_selection is
port (
  A, reg: in std_logic_vector(m-1 downto 0);
  clk, out_en, out_sel: in std_logic;
  i: in std_logic_vector(2 downto 0);
  OUT0, OUT1, OUT2, OUT3, OUT4, OUT5, OUT6, OUT7: out std_logic_vector(m-1 downto 0)  
);
end component;

component register_bank is
port (
  reg_in: in std_logic_vector(m-1 downto 0);
  clk, write_reg: in std_logic;
  i, j, k: in std_logic_vector(3 downto 0);
  left_out, right_out: out std_logic_vector(m-1 downto 0)
);
end component;

component go_to is
port (
  N, data: in std_logic_vector(m-1 downto 0);
  clk, reset: in std_logic;
  numb_sel: in std_logic_vector(3 downto 0);
  number: inout std_logic_vector(m-1 downto 0)  
);
end component;

begin

comp1: input_selection
port map (IN0 => IN0, IN1 => IN1, IN2 => IN2, IN3 => IN3, IN4 => IN4, IN5 => IN5, IN6 => IN6, IN7 => IN7, 
A => instruction(11 downto 4), result => result, j => instruction(6 downto 4), 
input_control => instruction(14 downto 13), to_reg => reg_in);

comp2: computation_resources
port map (left_in => left_out, right_in => right_out, operation => instruction(12), result => result);

comp3: output_selection
port map(A => instruction(7 downto 0), reg => right_out, clk => clk, 
  out_en => out_en, out_sel => instruction(13), i => instruction(10 downto 8),
  OUT0 => OUT0, OUT1 => OUT1, OUT2 => OUT2, OUT3 => OUT3, OUT4 => OUT4, OUT5 => OUT5, OUT6 => OUT6, OUT7 => OUT7);

comp4: register_bank
port map(reg_in => reg_in, clk => clk, write_reg => write_reg, i => instruction(11 downto 8), 
         j => instruction(7 downto 4), k => instruction(3 downto 0), left_out => left_out, right_out => right_out);

comp5: go_to
port map(N => instruction(7 downto 0), data => left_out, clk => clk, reset => reset, 
         numb_sel => instruction(15 downto 12), number => number);




out_en <= instruction(15) AND NOT(instruction(14));
--write_reg <= NOT(instruction(15)) AND (NOT(instruction(14)) OR NOT(instruction(13)));
write_reg <= NOT(instruction(15));

end structure;
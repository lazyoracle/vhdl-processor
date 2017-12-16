library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.main_parameters.all;
entity register_bank is
port (
 reg_in: in std_logic_vector(m-1 downto 0);
 clk, write_reg: in std_logic;
 i, j, k: in std_logic_vector(3 downto 0);
 left_out, right_out: out std_logic_vector(m-1 downto 0)  
);
end register_bank;

architecture behavior of register_bank is

type memory is array (0 to 15) of std_logic_vector(m-1 downto 0);
signal X: memory;
signal ii, jj, kk: integer range 0 to 15;

begin

ii <= conv_integer(i);
jj <= conv_integer(j);
kk <= conv_integer(k);

bank_registers: process(clk)
begin
    if clk'event and clk = '1' then
		   if write_reg = '1' then X(conv_integer(k)) <= reg_in; end if;
	  end if;
end process;

left_out <= X(conv_integer(i));
right_out <= X(conv_integer(j));
	
end behavior;	

--library ieee; 
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--use work.main_parameters.all;
--entity test_register_bank is end test_register_bank;
--
--architecture test of test_register_bank is
--
--component register_bank is
--port (
--  reg_in: in std_logic_vector(m-1 downto 0);
--  clk, write_reg: in std_logic;
--  i, j, k: in std_logic_vector(3 downto 0);
--  left_out, right_out: out std_logic_vector(m-1 downto 0)  
--);
--end component;
--
--signal reg_in: std_logic_vector(m-1 downto 0);
--signal clk: std_logic := '0';
--signal write_reg: std_logic;
--signal i, j, k: std_logic_vector(3 downto 0);
--signal left_out, right_out: std_logic_vector(m-1 downto 0);
--
--begin
--
--dut: register_bank
--port map(reg_in => reg_in, clk => clk, write_reg => write_reg, i => i, j => j, k => k, 
--left_out => left_out, right_out => right_out);
--  
--clk <= not(clk) after 10 ns;
--
--process
--begin
--reg_in <= "00000000"; 
--write_reg <= '1';
--i <= "0000";
--j <= "0000";
--k <= "0000";
--
--for p in 0 to 15 loop
--  wait for 100 ns;
--  k <= k + "0001";
--  reg_in <= reg_in + "00000001";
--end loop;
--
--write_reg <= '0';
--for p in 0 to 15 loop
--  wait for 100 ns;
--  i <= i + "0001";
--  j <= j + "0001";
--  k <= k + "0001";
--end loop;
--
--write_reg <= '1';
--for p in 0 to 15 loop
--  wait for 100 ns;
--  k <= k + "0001";
--  reg_in <= reg_in - "00000001";
--end loop;
--
--wait;
--
--end process;
--
--end test;
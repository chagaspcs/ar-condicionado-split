LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Temporizador IS
	PORT (	en_T, sleep_T, dec1_T, rst_T, wr_T, clock	: IN STD_LOGIC;
		min_T :	OUT std_logic_vector (90 DOWNTO 0);
		sel_M : OUT STD_LOGIC;
		led_TmrOn_T : OUT STD_LOGIC);
END Temporizador;
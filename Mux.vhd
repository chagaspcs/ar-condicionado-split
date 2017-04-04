LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY Mux IS
	PORT (	sel_M : IN STD_LOGIC;
		min_T : IN std_logic_vector (90 downto 0));
END Mux
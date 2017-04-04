LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;


entity Contador is
	port (clock, reset, enable : in std_logic;
			q : out std_logic_vector (3 downto 0));
	
end Contador;

architecture ContadorDown of Contador is
begin
	process (clock, reset)
	variable cont : integer range 90 to 0;
	begin
		if reset = '1' then
			cont := 0;
		elsif clock'event and clock = '1' then	
			if enable = '1' then
				cont := cont +1;
			end if;
		end if;
	q <= conv_std_logic_vector (cont, 4);
	end process;
end ContadorDown;
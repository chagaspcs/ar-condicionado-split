LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE ieee.numeric_std;

ENTITY Temporizador IS
	PORT (	clock, enable, reset, set			:IN BIT;
				setm1										:IN INTEGER RANGE 0 TO 9 =: 0;
				disp0, disp1							:OUT STD_LOGIC_VECTOR (6 downto 0));
END Temporizador;


ARCHITECTURE Temporizador_arc OF Temporizador IS 
CONSTANT segundo : INTEGER := 99999;  -- definindo 1 segundo

BEGIN
		
	PROCESS(clock, enable, reset, set, setm1) 
		VARIABLE cont: INTEGER RANGE 0 TO segundo := 0;
		VARIABLE s0: INTEGER := 0;
		VARIABLE m0: INTEGER RANGE 0 DOWNTO 0 := 0;
		VARIABLE m1: INTEGER RANGE 9 DOWNTO 0 := 9;
	BEGIN
		IF reset = 1  THEN
			m1 := 0;
			m0 := 0;
		END IF;
		IF set = 1 THEN
			m0 := 0;
			m1 := setm1;
		END IF;	
		IF enable = '1' AND reset = '0' AND set = '0' THEN
			IF rising_edge(clock) THEN 		   
				IF(cont /= segundo) THEN 			
					cont := cont + 1;				                    
				ELSE 										
					cont := 0;
					s0 := s0 + 1;
					IF(s0 = 59) THEN
						m0 := m0 - 1;
						s0 := 0;
						IF (m0 = 0) THEN
							m1 := m1 - 1;
							m0 := 0;
								IF (m1 = 0 and m0 = 0) THEN
									enable <= '0';
								END IF;
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
		disp0 <= CONV_STD_LOGIC_VECTOR(m0,7);
		disp1 <= CONV_STD_LOGIC_VECTOR(m1,7);
	END PROCESS; 
END Temporizador_arc;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY debounce IS
  PORT( clk     : IN  STD_LOGIC;  --input clock
        button  : IN  STD_LOGIC;  --input signal to be debounced
        result  : OUT STD_LOGIC); --debounced signal
END debounce;

ARCHITECTURE FuncDebounce OF debounce IS
  SIGNAL   inff    : STD_LOGIC_VECTOR(1 DOWNTO 0); -- input flip flops
  CONSTANT cnt_max : INTEGER := (33000000/50)-1 :  -- 33MHz and 1/20ms=50Hz
  SIGNAL   count   : INTEGER range 0 to cnt_max := 0; 
BEGIN
  PROCESS(clk)
  BEGIN
    IF(clk'EVENT and clk = '1') THEN
      inff <= inff(0) & button;  -- sync in the input
      IF(inff(0)/=inff(1)) THEN  -- reset counter because input is changing
        count <= 0;
      ELSIF(count<cnt_max) THEN  -- stable input time is not yet met
        count <= count + 1;
      ELSE                       -- stable input time is met
        result <= inff(1);
      END IF;    
    END IF;
  END PROCESS; 
END FuncDebounce;
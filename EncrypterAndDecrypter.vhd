----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:37:07 02/06/2018 
-- Design Name: 
-- Module Name:    EncrypterAndDecrypter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EncrypterAndDecrypter is
    Port ( clock : in  STD_LOGIC;
           enable_en : in  STD_LOGIC;
           enable_de : in  STD_LOGIC;
           reset_en : in  STD_LOGIC;
           reset_de : in  STD_LOGIC;
           K : in  STD_LOGIC_VECTOR (31 downto 0);
           P_in : in  STD_LOGIC_VECTOR (31 downto 0);
           C_out : out  STD_LOGIC_VECTOR (31 downto 0);
           P_out : out  STD_LOGIC_VECTOR (31 downto 0));
end EncrypterAndDecrypter;

architecture Behavioral of EncrypterAndDecrypter is

	component Encrypter
		Port ( clock : in  STD_LOGIC;
				 K : in  STD_LOGIC_VECTOR (31 downto 0);
				 P : in  STD_LOGIC_VECTOR (31 downto 0);
				 C : out  STD_LOGIC_VECTOR (31 downto 0);
				 reset : in  STD_LOGIC;
				 done : out STD_LOGIC;
				 enable : in  STD_LOGIC);
	end component;
	component Decrypter
		Port ( clock : in  STD_LOGIC;
				 K : in  STD_LOGIC_VECTOR (31 downto 0);
				 C : in  STD_LOGIC_VECTOR (31 downto 0);
				 P : out  STD_LOGIC_VECTOR (31 downto 0);
				 reset : in  STD_LOGIC;
				 done : out STD_LOGIC;
				 enable : in  STD_LOGIC);
	end component;
	
	signal C_signal : STD_LOGIC_VECTOR (31 downto 0);

begin

	EN1 : Encrypter port map ( clock => clock, K => K, P => P_in, C => C_signal, reset => reset_en, enable => enable_en );
	DE1 : Decrypter port map ( clock => clock, K => K, C => C_signal, P => P_out, reset => reset_de, enable => enable_de );
	C_out <= C_signal;

end Behavioral;

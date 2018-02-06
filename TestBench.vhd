--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:37:59 02/06/2018
-- Design Name:   
-- Module Name:   /home/akshay/Xilinix/Lab3_Mysterious/TestBench.vhd
-- Project Name:  Lab3_Mysterious
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: EncrypterAndDecrypter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestBench IS
END TestBench;
 
ARCHITECTURE behavior OF TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT EncrypterAndDecrypter
    PORT(
         clock : IN  std_logic;
         enable_en : IN  std_logic;
         enable_de : IN  std_logic;
         reset_en : IN  std_logic;
         reset_de : IN  std_logic;
         K : IN  std_logic_vector(31 downto 0);
         P_in : IN  std_logic_vector(31 downto 0);
         C_out : OUT  std_logic_vector(31 downto 0);
         P_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal enable_en : std_logic := '0';
   signal enable_de : std_logic := '0';
   signal reset_en : std_logic := '0';
   signal reset_de : std_logic := '0';
   signal K : std_logic_vector(31 downto 0) := (others => '0');
   signal P_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal C_out : std_logic_vector(31 downto 0);
   signal P_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: EncrypterAndDecrypter PORT MAP (
          clock => clock,
          enable_en => enable_en,
          enable_de => enable_de,
          reset_en => reset_en,
          reset_de => reset_de,
          K => K,
          P_in => P_in,
          C_out => C_out,
          P_out => P_out
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		
		enable_en <= '0';
		enable_de <= '0';
		reset_en <= '0';
		reset_de <= '0';
		K <= "00000000000000000000000000000000";
		P_in <= "00000000000000000000000000000000";
		
      wait for clock_period;
		
		enable_en <= '1';
		K <= "00000010000001110000001000000011";
		P_in <= "11000000011000000000000000000011";
		
		wait for clock_period*35;
		
		enable_de <= '1';
		
		wait for clock_period*35;
		
		reset_en <= '1';
		reset_de <= '1';
		enable_en <= '0';
		enable_de <= '0';
		
		wait for clock_period;
		
		reset_en <= '0';
		enable_en <= '1';
		K <= "00010100010010001100111001100011";
		P_in <= "10000110011000000010110001000011";
		
		wait for clock_period*35;
		
		reset_de <= '0';
		enable_de <= '1';

      wait;
   end process;

END;

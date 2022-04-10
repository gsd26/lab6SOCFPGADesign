----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2022 09:34:47 AM
-- Design Name: 
-- Module Name: sineMultiplier - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sineMultiplier is
    Port ( sineDataTuner : in STD_LOGIC_VECTOR (31 downto 0);
           sineDataAdc : in STD_LOGIC_VECTOR (15 downto 0);
           sineMultipleOutReal : out STD_LOGIC_VECTOR (31 downto 0);
           sineMultipleOutImag : out STD_LOGIC_VECTOR (31 downto 0)
           
           );
end sineMultiplier;

architecture Behavioral of sineMultiplier is
signal sineTuner: signed(15 downto 0);

signal cosineTuner: signed(15 downto 0);

signal sineADC: signed(15 downto 0);
signal sineMultiplyReal: signed(31 downto 0);
signal sineMultiplyImag: signed(31 downto 0);

begin
sineADC<=signed(sineDataAdc);
cosineTuner<=signed(sineDataTuner(31 downto 16));
sineTuner<=signed(sineDataTuner(15 downto 0));

sineMultiplyReal<=sineADC * cosineTuner;
sineMultiplyImag<=sineADC * sineTuner;

--sineMultiplyReal<=shift_right(sineMultiplyReal, 14);
--sineMultiplyImag<=shift_right(sineMultiplyImag, 14);

sineMultipleOutReal<=std_logic_vector(shift_right(sineMultiplyReal, 14));--shift right by 14 should de
sineMultipleOutImag<=std_logic_vector(shift_right(sineMultiplyImag, 14));
--sineMultipleOutReal<=std_logic_vector(sineMultiplyReal);
--sineMultipleOutImag<=std_logic_vector(sineMultiplyImag);


end Behavioral;

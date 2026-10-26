library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ov7670_registers is
    Port ( clk      : in  STD_LOGIC;
           resend   : in  STD_LOGIC;
           advance  : in  STD_LOGIC;
           command  : out  std_logic_vector(15 downto 0);
           finished : out  STD_LOGIC);
end ov7670_registers;

architecture Behavioral of ov7670_registers is
   signal sreg    : std_logic_vector(15 downto 0);
   signal address : std_logic_vector(7 downto 0) := (others => '0');
begin
   command <= sreg;
   with sreg select finished <= '1' when x"FFFF", '0' when others;

   process(clk)
   begin
      if rising_edge(clk) then
         if resend = '1' then
            address <= (others => '0');
         elsif advance = '1' then
            address <= std_logic_vector(unsigned(address) + 1);
         end if;

         case address is
            when x"00" => sreg <= x"1280";
            when x"01" => sreg <= x"FFF0";
            when x"02" => sreg <= x"1204";
            when x"03" => sreg <= x"1100";
            when x"04" => sreg <= x"0C00";
            when x"05" => sreg <= x"3E00";
            when x"06" => sreg <= x"0400";
            when x"07" => sreg <= x"8C02";
            when x"08" => sreg <= x"4010";
            when x"09" => sreg <= x"3A04";
            when x"0A" => sreg <= x"1418";
            when x"0B" => sreg <= x"4FB3";
            when x"0C" => sreg <= x"50B3";
            when x"0D" => sreg <= x"5100";
            when x"0E" => sreg <= x"523D";

            when x"0F" => sreg <= x"53A7";
            when x"10" => sreg <= x"54E4";
            when x"11" => sreg <= x"589E";
            when x"12" => sreg <= x"3DC0";
            when x"13" => sreg <= x"1714";
            when x"14" => sreg <= x"1802";
            when x"15" => sreg <= x"3280";
            when x"16" => sreg <= x"1903";
            when x"17" => sreg <= x"1A7B";
            when x"18" => sreg <= x"030A";
            when x"19" => sreg <= x"0F41";
            when x"1A" => sreg <= x"1E00";
            when x"1B" => sreg <= x"330B";
            when x"1C" => sreg <= x"3C78";
            when x"1D" => sreg <= x"6900";
            when x"1E" => sreg <= x"7400";
            when x"1F" => sreg <= x"B084";
            when x"20" => sreg <= x"B10C";
            when x"21" => sreg <= x"B20E";
            when x"22" => sreg <= x"B380";
            when x"23" => sreg <= x"703A";
            when x"24" => sreg <= x"7135";
            when x"25" => sreg <= x"7211";
            when x"26" => sreg <= x"73F0";
            when x"27" => sreg <= x"A202";
            when x"28" => sreg <= x"7A20";
            when x"29" => sreg <= x"7B10";
            when x"2A" => sreg <= x"7C1E";
            when x"2B" => sreg <= x"7D35";
            when x"2C" => sreg <= x"7E5A";
            when x"2D" => sreg <= x"7F69";
            when x"2E" => sreg <= x"8076";
            when x"2F" => sreg <= x"8180";
            when x"30" => sreg <= x"8288";
            when x"31" => sreg <= x"838F";
            when x"32" => sreg <= x"8496";
            when x"33" => sreg <= x"85A3";
            when x"34" => sreg <= x"86AF";
            when x"35" => sreg <= x"87C4";
            when x"36" => sreg <= x"88D7";
            when x"37" => sreg <= x"89E8";
            when x"38" => sreg <= x"13E0";
            when x"39" => sreg <= x"0000";
            when x"3A" => sreg <= x"1000";
            when x"3B" => sreg <= x"0D40";
            when x"3C" => sreg <= x"1418";
            when x"3D" => sreg <= x"A505";
            when x"3E" => sreg <= x"AB07";
            when x"3F" => sreg <= x"2495";
            when x"40" => sreg <= x"2533";
            when x"41" => sreg <= x"26E3";
            when x"42" => sreg <= x"9F78";
            when x"43" => sreg <= x"A068";
            when x"44" => sreg <= x"A103";
            when x"45" => sreg <= x"A6D8";
            when x"46" => sreg <= x"A7D8";
            when x"47" => sreg <= x"A8F0";
            when x"48" => sreg <= x"A990";
            when x"49" => sreg <= x"AA94";
            when x"4A" => sreg <= x"13A7";
            when x"4B" => sreg <= x"6906";
            when others => sreg <= x"FFFF";
         end case;
      end if;
   end process;
end Behavioral;

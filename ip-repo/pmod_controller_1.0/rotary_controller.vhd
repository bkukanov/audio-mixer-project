----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2018 07:09:13 PM
-- Design Name: 
-- Module Name: rotary_controller - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rotary_controller is
    Port(
    Rotary_a : in std_logic;
    Rotary_b : in std_logic;
    Button : in std_logic;
    Switch : in std_logic;
    clk : in std_logic;
    Rotary_event : out std_logic);
end rotary_controller;

architecture Behavioral of rotary_controller is

signal debounced_Button : std_logic;
signal debounced_Switch : std_logic;
signal alltopulse : std_logic;

component debouncer is
    Port ( clk : in STD_LOGIC;
           input : in STD_LOGIC;
           result : out STD_LOGIC);
end component debouncer;

component pulse_generator is
    Port ( clk : in STD_LOGIC;
           input : in STD_LOGIC;
           pulse_out : out STD_LOGIC);
end component pulse_generator;

begin

    Button_debouncer : debouncer
    Port map(
        clk => clk,
        input => Button,
        result => debounced_Button);
    
    Switch_debouncer : debouncer
    Port map(
        clk => clk,
        input => Switch,
        result => debounced_Switch);
    
    pulsegen : pulse_generator
    Port map(
        clk => clk,
        input => alltopulse,
        pulse_out => Rotary_event);
    alltopulse <= Rotary_a or Rotary_b or debounced_Button or debounced_Switch;
    
end Behavioral;
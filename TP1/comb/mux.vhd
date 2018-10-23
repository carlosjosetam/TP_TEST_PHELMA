LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mux IS
PORT(
  a	: IN BIT;
  b	: IN BIT;
  com	: IN BIT;
  s	: OUT BIT;
  vdd	: IN BIT;
  vss	: IN BIT
);
END mux;

ARCHITECTURE RTL OF mux IS
  SIGNAL out_and2	: BIT;
  SIGNAL out_and1	: BIT;
  SIGNAL com_not	: BIT;

  COMPONENT o2_x2
  PORT(
  i0	: IN BIT;
  i1	: IN BIT;
  q	: OUT BIT;
  vdd	: IN BIT;
  vss	: IN BIT
   );
  END COMPONENT;

  COMPONENT inv_x1
  PORT(
  i	: IN BIT;
  nq	: OUT BIT;
  vdd	: IN BIT;
  vss	: IN BIT
   );
  END COMPONENT;

  COMPONENT a2_x2
  PORT(
  i0	: IN BIT;
  i1	: IN BIT;
  q	: OUT BIT;
  vdd	: IN BIT;
  vss	: IN BIT
   );
  END COMPONENT;

BEGIN
  or1 : o2_x2
  PORT MAP (
    i0 => out_and1,
    i1 => out_and2,
    q => s,
    vdd => vdd,
    vss => vss
  );
  inv : inv_x1
  PORT MAP (
    i => com,
    nq => com_not,
    vdd => vdd,
    vss => vss
  );
  and2 : a2_x2
  PORT MAP (
    i0 => com_not,
    i1 => b,
    q => out_and2,
    vdd => vdd,
    vss => vss
  );
  and1 : a2_x2
  PORT MAP (
    i0 => com,
    i1 => a,
    q => out_and1,
    vdd => vdd,
    vss => vss
  );
END RTL;

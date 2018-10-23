--LIBRARY IEEE;
--USE IEEE.std_logic_1164.ALL;
--USE IEEE.numeric_std.ALL;

ENTITY exemple IS
PORT(
  e0	: IN BIT;
  e1	: IN BIT;
  e2	: IN BIT;
  e3	: IN BIT;
  s0	: OUT BIT;
  s1	: OUT BIT;
  vdd	: IN BIT;
  vss	: IN BIT

);
END exemple;

ARCHITECTURE VST OF exemple IS
  SIGNAL sg0       :BIT;
  SIGNAL sg1       :BIT;
  SIGNAL sg2       :BIT;
  SIGNAL sg3       :BIT;
  SIGNAL sg4       :BIT;
  SIGNAL sg5       :BIT;
  SIGNAL sg6       :BIT;
  SIGNAL sg7       :BIT;

  COMPONENT inv_x1
  PORT(
  i	: IN BIT;
  nq	: OUT BIT;
  vdd	: IN BIT;
  vss	: IN BIT
   );
  END COMPONENT;

  COMPONENT xr2_x1
  PORT(
  i0	: IN BIT;
  i1	: IN BIT;
  q	: OUT BIT;
  vdd	: IN BIT;
  vss	: IN BIT
   );
  END COMPONENT;

  COMPONENT no2_x1
  PORT(
  i0	: IN BIT;
  i1	: IN BIT;
  nq	: OUT BIT;
  vdd	: IN BIT;
  vss	: IN BIT
   );
  END COMPONENT;

  COMPONENT o2_x2
  PORT(
  i0	: IN BIT;
  i1	: IN BIT;
  q	: OUT BIT;
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


  g1 : inv_x1
  PORT MAP (
     i => e1,
    nq => sg1,
    vdd => vdd,
    vss => vss
  );

  g2 : xr2_x1
  PORT MAP (
    i0 => e1,
    i1 => e2,
     q => sg2,
    vdd => vdd,
    vss => vss
  );

  g3 : xr2_x1
  PORT MAP (
    i0 => e2,
    i1 => sg1,
     q => sg3,
    vdd => vdd,
    vss => vss
  );

  g4 : no2_x1
  PORT MAP (
    i0 => sg1,
    i1 => e3,
    nq => sg4,
    vdd => vdd,
    vss => vss
  );

  g5 : inv_x1
  PORT MAP (
     i => e0,
    nq => sg5,
    vdd => vdd,
    vss => vss
  );

  g6 : o2_x2
  PORT MAP (
    i0 => sg5,
    i1 => sg2,
     q => sg6,
    vdd => vdd,
    vss => vss
  );

  g7 : a2_x2
  PORT MAP (
    i0 => sg2,
    i1 => sg3,
     q => sg7,
    vdd => vdd,
    vss => vss
  );

  g8 : no2_x1
  PORT MAP (
    i0 => sg3,
    i1 => sg4,
    nq => s1,
    vdd => vdd,
    vss => vss
  );

  g9 : no2_x1
  PORT MAP (
    i0 => sg6,
    i1 => sg7,
    nq => s0,
    vdd => vdd,
    vss => vss
  );
END VST;

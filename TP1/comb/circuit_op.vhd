--LIBRARY IEEE;
--USE IEEE.std_logic_1164.ALL;
--USE IEEE.numeric_std.ALL;

ENTITY exemple IS
PORT(
  e0	: IN BIT;
  e1	: IN BIT;
  e2	: IN BIT;
  e3	: IN BIT;
  s	: OUT BIT;
  vdd	: IN BIT;
  vss	: IN BIT
);
END exemple;

ARCHITECTURE VST OF exemple IS
  SIGNAL sg6       :BIT;
  SIGNAL sg7       :BIT;
  SIGNAL sg9       :BIT;
  SIGNAL sg10      :BIT;
  SIGNAL sg11      :BIT;

  COMPONENT no2_x1
  PORT(
  i0	: IN BIT;
  i1	: IN BIT;
  nq	: OUT BIT;
  vdd	: IN BIT;
  vss	: IN BIT
   );
  END COMPONENT;

  COMPONENT no3_x1
  PORT(
  i0	: IN BIT;
  i1	: IN BIT;
  i2	: IN BIT;
  nq	: OUT BIT;
  vdd	: IN BIT;
  vss	: IN BIT
   );
  END COMPONENT;


BEGIN
  g6 : no2_x1
  PORT MAP (
    i0 => e1,
    i1 => e2,
    nq => sg6,
    vdd => vdd,
    vss => vss
  );
  g7 : no2_x1
  PORT MAP (
    i0 => e3,
    i1 => e1,
    nq => sg7,
    vdd => vdd,
    vss => vss
  );
  g9 : no2_x1
  PORT MAP (
    i0 => e0,
    i1 => sg6,
    nq => sg9,
    vdd => vdd,
    vss => vss
  );
  g10: no2_x1
  PORT MAP (
    i0 => sg6,
    i1 => e3,
    nq => sg10,
    vdd => vdd,
    vss => vss
  );
  g11: no2_x1
  PORT MAP (
    i0 => sg7,
    i1 => e2,
    nq => sg11,
    vdd => vdd,
    vss => vss
  );
  g12: no3_x1
  PORT MAP (
    i0 => sg9,
    i1 => sg10,
    i2 => sg11,
    nq => s,
    vdd => vdd,
    vss => vss
  );
END VST;

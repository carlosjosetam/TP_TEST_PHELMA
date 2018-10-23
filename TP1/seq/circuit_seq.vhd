entity fsm is
   port (
      a   : in      bit;
      b   : in      bit;
      ck  : in      bit;
      s   : out     bit
 );
end fsm;

architecture structural of fsm is
Component na2_x1
      port (
      i0  : in      bit;
      i1  : in      bit;
      nq  : out     bit
 );
end component;

Component sff1_x4
   port (
      ck  : in      bit;
      i   : in      bit;
      q   : out     bit
 );
end component;

Component o2_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      q   : out     bit
 );
end component;

signal f   : bit;
signal e   : bit;
signal d   : bit;
signal c   : bit;

begin

g1 : na2_x1
   port map (
      i0  => e,
      i1  => a,
      nq  => c
   );

g2 : na2_x1
    port map (
      i0  => f,
      i1  => b,
      nq  => d
   );

g3 : sff1_x4
   port map (
      ck  => ck,
      i   => c,
      q   => e
   );

g4 : sff1_x4
   port map (
      ck  => ck,
      i   => d,
      q   => f
   );

g5 : o2_x2
   port map (
      i0  => e,
      i1  => f,
      q   => s
   );

end structural;

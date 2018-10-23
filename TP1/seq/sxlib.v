module a2_x2 (i0, i1, q);

  input  	i0;
  input  	i1;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	q;

  assign	q = (i0 & i1);

endmodule


module a2_x4 (i0, i1, q);

  input  	i0;
  input  	i1;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	q;

  assign	q = (i0 & i1);

endmodule


module a3_x2 (i0, i1, i2, q);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	q;

  assign	q = ((i0 & i1) & i2);

endmodule


module a3_x4 (i0, i1, i2, q);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	q;

  assign	q = ((i0 & i1) & i2);

endmodule


module a4_x2 (i0, i1, i2, i3, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	q;

  assign	q = (((i0 & i1) & i2) & i3);

endmodule


module a4_x4 (i0, i1, i2, i3, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	q;

  assign	q = (((i0 & i1) & i2) & i3);

endmodule


module an12_x1 (i0, i1, q);

  input  	i0;
  input  	i1;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	q;

  assign	q = (~(i0) & i1);

endmodule


module an12_x4 (i0, i1, q);

  input  	i0;
  input  	i1;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	q;

  assign	q = (~(i0) & i1);

endmodule


module ao22_x2 (i0, i1, i2, q);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	q;

  assign	q = ((i0 | i1) & i2);

endmodule


module ao22_x4 (i0, i1, i2, q);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	q;

  assign	q = ((i0 | i1) & i2);

endmodule


module ao2o22_x2 (i0, i1, i2, i3, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	q;

  assign	q = ((i0 | i1) & (i2 | i3));

endmodule


module ao2o22_x4 (i0, i1, i2, i3, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	q;

  assign	q = ((i0 | i1) & (i2 | i3));

endmodule


module buf_x2 (i, q);

  input  	i;
  output 	q;
  wire   	i;
  wire   	q;

  assign	q = i;

endmodule


module buf_x4 (i, q);

  input  	i;
  output 	q;
  wire   	i;
  wire   	q;

  assign	q = i;

endmodule


module buf_x8 (i, q);

  input  	i;
  output 	q;
  wire   	i;
  wire   	q;

  assign	q = i;

endmodule


module fulladder_x2 (a1, a2, a3, a4, b1, b2, b3, b4, cin1, cin2, cin3, cout, sout);

  input  	a1;
  input  	a2;
  input  	a3;
  input  	a4;
  input  	b1;
  input  	b2;
  input  	b3;
  input  	b4;
  input  	cin1;
  input  	cin2;
  input  	cin3;
  output 	cout;
  output 	sout;
  wire   	a1;
  wire   	a2;
  wire   	a3;
  wire   	a4;
  wire   	b1;
  wire   	b2;
  wire   	b3;
  wire   	b4;
  wire   	cin1;
  wire   	cin2;
  wire   	cin3;
  wire   	cout;
  wire   	sout;

  wire	  ncout;

  assign	cout = ~(ncout);
  assign	sout = (((a3 & b3) & cin2) | (((a4 | b4) | cin3) & ncout));
  assign	ncout = ~(((a1 & b1) | ((a2 | b2) & cin1)));

endmodule


module fulladder_x4 (a1, a2, a3, a4, b1, b2, b3, b4, cin1, cin2, cin3, cout, sout);

  input  	a1;
  input  	a2;
  input  	a3;
  input  	a4;
  input  	b1;
  input  	b2;
  input  	b3;
  input  	b4;
  input  	cin1;
  input  	cin2;
  input  	cin3;
  output 	cout;
  output 	sout;
  wire   	a1;
  wire   	a2;
  wire   	a3;
  wire   	a4;
  wire   	b1;
  wire   	b2;
  wire   	b3;
  wire   	b4;
  wire   	cin1;
  wire   	cin2;
  wire   	cin3;
  wire   	cout;
  wire   	sout;

  wire	  ncout;

  assign	cout = ~(ncout);
  assign	sout = (((a3 & b3) & cin2) | (((a4 | b4) | cin3) & ncout));
  assign	ncout = ~(((a1 & b1) | ((a2 | b2) & cin1)));

endmodule


module halfadder_x2 (a, b, cout, sout);

  input  	a;
  input  	b;
  output 	cout;
  output 	sout;
  wire   	a;
  wire   	b;
  wire   	cout;
  wire   	sout;

  assign	cout = (a & b);
  assign	sout = (a ^ b);

endmodule


module halfadder_x4 (a, b, cout, sout);

  input  	a;
  input  	b;
  output 	cout;
  output 	sout;
  wire   	a;
  wire   	b;
  wire   	cout;
  wire   	sout;

  assign	cout = (a & b);
  assign	sout = (a ^ b);

endmodule


module inv_x1 (i, nq);

  input  	i;
  output 	nq;
  wire   	i;
  wire   	nq;

  assign	nq = ~(i);

endmodule


module inv_x2 (i, nq);

  input  	i;
  output 	nq;
  wire   	i;
  wire   	nq;

  assign	nq = ~(i);

endmodule


module inv_x4 (i, nq);

  input  	i;
  output 	nq;
  wire   	i;
  wire   	nq;

  assign	nq = ~(i);

endmodule


module inv_x8 (i, nq);

  input  	i;
  output 	nq;
  wire   	i;
  wire   	nq;

  assign	nq = ~(i);

endmodule


module mx2_x2 (cmd, i0, i1, q);

  input  	cmd;
  input  	i0;
  input  	i1;
  output 	q;
  wire   	cmd;
  wire   	i0;
  wire   	i1;
  wire   	q;

  assign	q = ((i1 & cmd) | (~(cmd) & i0));

endmodule


module mx2_x4 (cmd, i0, i1, q);

  input  	cmd;
  input  	i0;
  input  	i1;
  output 	q;
  wire   	cmd;
  wire   	i0;
  wire   	i1;
  wire   	q;

  assign	q = ((i1 & cmd) | (~(cmd) & i0));

endmodule


module mx3_x2 (cmd0, cmd1, i0, i1, i2, q);

  input  	cmd0;
  input  	cmd1;
  input  	i0;
  input  	i1;
  input  	i2;
  output 	q;
  wire   	cmd0;
  wire   	cmd1;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	q;

  assign	q = ((~(cmd0) & i0) | (cmd0 & ((cmd1 & i1) | (~(cmd1) & i2))));

endmodule


module mx3_x4 (cmd0, cmd1, i0, i1, i2, q);

  input  	cmd0;
  input  	cmd1;
  input  	i0;
  input  	i1;
  input  	i2;
  output 	q;
  wire   	cmd0;
  wire   	cmd1;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	q;

  assign	q = ((~(cmd0) & i0) | (cmd0 & ((cmd1 & i1) | (~(cmd1) & i2))));

endmodule


module na2_x1 (i0, i1, nq);

  input  	i0;
  input  	i1;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	nq;

  assign	nq = ~((i0 & i1));

endmodule


module na2_x4 (i0, i1, nq);

  input  	i0;
  input  	i1;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	nq;

  assign	nq = ~((i0 & i1));

endmodule


module na3_x1 (i0, i1, i2, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	nq;

  assign	nq = ~(((i0 & i1) & i2));

endmodule


module na3_x4 (i0, i1, i2, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	nq;

  assign	nq = ~(((i0 & i1) & i2));

endmodule


module na4_x1 (i0, i1, i2, i3, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	nq;

  assign	nq = ~((((i0 & i1) & i2) & i3));

endmodule


module na4_x4 (i0, i1, i2, i3, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	nq;

  assign	nq = ~((((i0 & i1) & i2) & i3));

endmodule


module nao22_x1 (i0, i1, i2, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	nq;

  assign	nq = ~(((i0 | i1) & i2));

endmodule


module nao22_x4 (i0, i1, i2, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	nq;

  assign	nq = ~(((i0 | i1) & i2));

endmodule


module nao2o22_x1 (i0, i1, i2, i3, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	nq;

  assign	nq = ~(((i0 | i1) & (i2 | i3)));

endmodule


module nao2o22_x4 (i0, i1, i2, i3, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	nq;

  assign	nq = ~(((i0 | i1) & (i2 | i3)));

endmodule


module nmx2_x1 (cmd, i0, i1, nq);

  input  	cmd;
  input  	i0;
  input  	i1;
  output 	nq;
  wire   	cmd;
  wire   	i0;
  wire   	i1;
  wire   	nq;

  assign	nq = ~(((i0 & ~(cmd)) | (i1 & cmd)));

endmodule


module nmx2_x4 (cmd, i0, i1, nq);

  input  	cmd;
  input  	i0;
  input  	i1;
  output 	nq;
  wire   	cmd;
  wire   	i0;
  wire   	i1;
  wire   	nq;

  assign	nq = ~(((i0 & ~(cmd)) | (i1 & cmd)));

endmodule


module nmx3_x1 (cmd0, cmd1, i0, i1, i2, nq);

  input  	cmd0;
  input  	cmd1;
  input  	i0;
  input  	i1;
  input  	i2;
  output 	nq;
  wire   	cmd0;
  wire   	cmd1;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	nq;

  assign	nq = ~(((~(cmd0) & i0) | (cmd0 & ((cmd1 & i1) | (~(cmd1) & i2)))));

endmodule


module nmx3_x4 (cmd0, cmd1, i0, i1, i2, nq);

  input  	cmd0;
  input  	cmd1;
  input  	i0;
  input  	i1;
  input  	i2;
  output 	nq;
  wire   	cmd0;
  wire   	cmd1;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	nq;

  assign	nq = ~(((~(cmd0) & i0) | (cmd0 & ((cmd1 & i1) | (~(cmd1) & i2)))));

endmodule


module no2_x1 (i0, i1, nq);

  input  	i0;
  input  	i1;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	nq;

  assign	nq = ~((i0 | i1));

endmodule


module no2_x4 (i0, i1, nq);

  input  	i0;
  input  	i1;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	nq;

  assign	nq = ~((i0 | i1));

endmodule


module no3_x1 (i0, i1, i2, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	nq;

  assign	nq = ~(((i0 | i1) | i2));

endmodule


module no3_x4 (i0, i1, i2, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	nq;

  assign	nq = ~(((i0 | i1) | i2));

endmodule


module no4_x1 (i0, i1, i2, i3, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	nq;

  assign	nq = ~((((i0 | i1) | i2) | i3));

endmodule


module no4_x4 (i0, i1, i2, i3, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	nq;

  assign	nq = ~((((i0 | i1) | i2) | i3));

endmodule


module noa22_x1 (i0, i1, i2, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	nq;

  assign	nq = ~(((i0 & i1) | i2));

endmodule


module noa22_x4 (i0, i1, i2, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	nq;

  assign	nq = ~(((i0 & i1) | i2));

endmodule


module noa2a22_x1 (i0, i1, i2, i3, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	nq;

  assign	nq = ~(((i0 & i1) | (i2 & i3)));

endmodule


module noa2a22_x4 (i0, i1, i2, i3, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	nq;

  assign	nq = ~(((i0 & i1) | (i2 & i3)));

endmodule


module noa2a2a23_x1 (i0, i1, i2, i3, i4, i5, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  input  	i5;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	i5;
  wire   	nq;

  assign	nq = ~((((i0 & i1) | (i2 & i3)) | (i4 & i5)));

endmodule


module noa2a2a23_x4 (i0, i1, i2, i3, i4, i5, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  input  	i5;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	i5;
  wire   	nq;

  assign	nq = ~((((i0 & i1) | (i2 & i3)) | (i4 & i5)));

endmodule


module noa2a2a2a24_x1 (i0, i1, i2, i3, i4, i5, i6, i7, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  input  	i5;
  input  	i6;
  input  	i7;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	i5;
  wire   	i6;
  wire   	i7;
  wire   	nq;

  assign	nq = ~(((((i0 & i1) | (i2 & i3)) | (i4 & i5)) | (i6 & i7)));

endmodule


module noa2a2a2a24_x4 (i0, i1, i2, i3, i4, i5, i6, i7, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  input  	i5;
  input  	i6;
  input  	i7;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	i5;
  wire   	i6;
  wire   	i7;
  wire   	nq;

  assign	nq = ~(((((i0 & i1) | (i2 & i3)) | (i4 & i5)) | (i6 & i7)));

endmodule


module noa2ao222_x1 (i0, i1, i2, i3, i4, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	nq;

  assign	nq = ~(((i0 & i1) | ((i2 | i3) & i4)));

endmodule


module noa2ao222_x4 (i0, i1, i2, i3, i4, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	nq;

  assign	nq = ~(((i0 & i1) | ((i2 | i3) & i4)));

endmodule


module noa3ao322_x1 (i0, i1, i2, i3, i4, i5, i6, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  input  	i5;
  input  	i6;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	i5;
  wire   	i6;
  wire   	nq;

  assign	nq = ~((((i0 & i1) & i2) | (((i3 | i4) | i5) & i6)));

endmodule


module noa3ao322_x4 (i0, i1, i2, i3, i4, i5, i6, nq);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  input  	i5;
  input  	i6;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	i5;
  wire   	i6;
  wire   	nq;

  assign	nq = ~((((i0 & i1) & i2) | (((i3 | i4) | i5) & i6)));

endmodule


module nxr2_x1 (i0, i1, nq);

  input  	i0;
  input  	i1;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	nq;

  assign	nq = ~((i0 ^ i1));

endmodule


module nxr2_x4 (i0, i1, nq);

  input  	i0;
  input  	i1;
  output 	nq;
  wire   	i0;
  wire   	i1;
  wire   	nq;

  assign	nq = ~((i0 ^ i1));

endmodule


module o2_x2 (i0, i1, q);

  input  	i0;
  input  	i1;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	q;

  assign	q = (i0 | i1);

endmodule


module o2_x4 (i0, i1, q);

  input  	i0;
  input  	i1;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	q;

  assign	q = (i0 | i1);

endmodule


module o3_x2 (i0, i1, i2, q);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	q;

  assign	q = ((i0 | i1) | i2);

endmodule


module o3_x4 (i0, i1, i2, q);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	q;

  assign	q = ((i0 | i1) | i2);

endmodule


module o4_x2 (i0, i1, i2, i3, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	q;

  assign	q = (((i0 | i1) | i2) | i3);

endmodule


module o4_x4 (i0, i1, i2, i3, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	q;

  assign	q = (((i0 | i1) | i2) | i3);

endmodule


module oa22_x2 (i0, i1, i2, q);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	q;

  assign	q = ((i0 & i1) | i2);

endmodule


module oa22_x4 (i0, i1, i2, q);

  input  	i0;
  input  	i1;
  input  	i2;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	q;

  assign	q = ((i0 & i1) | i2);

endmodule


module oa2a22_x2 (i0, i1, i2, i3, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	q;

  assign	q = ((i0 & i1) | (i2 & i3));

endmodule


module oa2a22_x4 (i0, i1, i2, i3, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	q;

  assign	q = ((i0 & i1) | (i2 & i3));

endmodule


module oa2a2a23_x2 (i0, i1, i2, i3, i4, i5, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  input  	i5;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	i5;
  wire   	q;

  assign	q = (((i0 & i1) | (i2 & i3)) | (i4 & i5));

endmodule


module oa2a2a23_x4 (i0, i1, i2, i3, i4, i5, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  input  	i5;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	i5;
  wire   	q;

  assign	q = (((i0 & i1) | (i2 & i3)) | (i4 & i5));

endmodule


module oa2a2a2a24_x2 (i0, i1, i2, i3, i4, i5, i6, i7, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  input  	i5;
  input  	i6;
  input  	i7;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	i5;
  wire   	i6;
  wire   	i7;
  wire   	q;

  assign	q = ((((i0 & i1) | (i2 & i3)) | (i4 & i5)) | (i6 & i7));

endmodule


module oa2a2a2a24_x4 (i0, i1, i2, i3, i4, i5, i6, i7, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  input  	i5;
  input  	i6;
  input  	i7;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	i5;
  wire   	i6;
  wire   	i7;
  wire   	q;

  assign	q = ((((i0 & i1) | (i2 & i3)) | (i4 & i5)) | (i6 & i7));

endmodule


module oa2ao222_x2 (i0, i1, i2, i3, i4, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	q;

  assign	q = ((i0 & i1) | (i4 & (i2 | i3)));

endmodule


module oa2ao222_x4 (i0, i1, i2, i3, i4, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	q;

  assign	q = ((i0 & i1) | (i4 & (i2 | i3)));

endmodule


module oa3ao322_x2 (i0, i1, i2, i3, i4, i5, i6, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  input  	i5;
  input  	i6;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	i5;
  wire   	i6;
  wire   	q;

  assign	q = (((i0 & i1) & i2) | (i6 & ((i3 | i4) | i5)));

endmodule


module oa3ao322_x4 (i0, i1, i2, i3, i4, i5, i6, q);

  input  	i0;
  input  	i1;
  input  	i2;
  input  	i3;
  input  	i4;
  input  	i5;
  input  	i6;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	i2;
  wire   	i3;
  wire   	i4;
  wire   	i5;
  wire   	i6;
  wire   	q;

  assign	q = (((i0 & i1) & i2) | (i6 & ((i3 | i4) | i5)));

endmodule


module on12_x1 (i0, i1, q);

  input  	i0;
  input  	i1;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	q;

  assign	q = (~(i0) | i1);

endmodule


module on12_x4 (i0, i1, q);

  input  	i0;
  input  	i1;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	q;

  assign	q = (~(i0) | i1);

endmodule


module one_x0 (q);

  output 	q;
  wire   	q;

  assign	q = 1'b1;

endmodule


module xr2_x1 (i0, i1, q);

  input  	i0;
  input  	i1;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	q;

  assign	q = (i0 ^ i1);

endmodule


module xr2_x4 (i0, i1, q);

  input  	i0;
  input  	i1;
  output 	q;
  wire   	i0;
  wire   	i1;
  wire   	q;

  assign	q = (i0 ^ i1);

endmodule


module zero_x0 (nq);

  output 	nq;
  wire   	nq;

  assign	nq = 1'b0;

endmodule

module sff1_x4(ck, i, q);
  input		ck;
  input		i;
  output	q;
  wire 		ck;
  wire 		i;
  wire  	q;

  _DFF s1 (0, 0, ck, i, q);

endmodule

module sff2_x4(ck, cmd, i0, i1 , q);
  input		ck;
  input   	i0;
  input   	i1;
  input   	cmd;
  output	q;
  wire 		ck;
  wire    	i0;
  wire    	i1;
  wire    	cmd;
  wire  	q;

  mx2_x2(cmd, i0, i1, internal_s);
  _DFF s1 (0, 0, ck, internal_s, q);

endmodule

module sff3_x4(ck, cmd0, cmd1, i0, i1, i2, q);
  input		ck;
  input   	i0;
  input   	i1;
  input   	i2;
  input   	cmd0;
  input   	cmd1;
  output	q;
  wire 		ck;
  wire    	i0;
  wire    	i1;
  wire    	i2;
  wire    	cmd0;
  wire    	cmd1;
  wire  	q;

  mx3_x2(cmd0, cmd1, i0, i1, i2, internal_s);
  _DFF s1 (0, 0, ck, internal_s, q) ;

endmodule

module nts_x1(cmd, i, nq);
 
  input   	i;
  input   	cmd;
  output  	nq;
  wire    	i;
  wire    	cmd;
  wire    	nq;
 
  inv_x1(i, internal_ni);
  _TSD nts (cmd, internal_ni, nq); 

endmodule

module nts_x2(cmd, i, nq);
 
  input   	i;
  input   	cmd;
  output  	nq;
  wire    	i;
  wire    	cmd;
  wire    	nq;

  inv_x1(i, internal_ni);
  _TSD nts (cmd, internal_ni, nq);

endmodule

module ts_x4(cmd, i, q);
 
  input   	i;
  input   	cmd;
  output  	q;
  wire    	i;
  wire    	cmd;
  wire    	q;
 
  _TSD nts (cmd, i, q);

endmodule

module ts_x8(cmd, i, q);
 
  input   	i;
  input   	cmd;
  output  	q;
  wire    	i;
  wire    	cmd;
  wire    	q;
 
  _TSD nts (cmd, i, q);

endmodule

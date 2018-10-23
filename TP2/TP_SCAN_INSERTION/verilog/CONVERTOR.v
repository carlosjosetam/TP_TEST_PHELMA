
module CONVERTOR ( T0, T1, T2, T3, T4, T5, A0, B0, C0, D0, E0, F0, G0, A1, B1, 
        C1, D1, E1, F1, G1 );
  input T0, T1, T2, T3, T4, T5;
  output A0, B0, C0, D0, E0, F0, G0, A1, B1, C1, D1, E1, F1, G1;
  wire   D0, net_120, net_121, net_122, net_123, net_124, net_125, net_126,
         net_127, net_128, net_129, net_130, net_131, net_132, net_133,
         net_134, net_135, net_136, net_137, net_138, net_139, net_140,
         net_141, net_142, net_143, net_144, net_145, net_146, net_147,
         net_148, net_149, net_150, net_151, net_152, net_153, net_154,
         net_155, net_156, net_157, net_158, net_159, net_160, net_161,
         net_162, net_163, net_164, net_165, net_166, net_167, net_168,
         net_169, net_170, net_171, net_172, net_173, net_174, net_175,
         net_176, net_177, net_178, net_179, net_180, net_181, net_182,
         net_183, net_184, net_185, net_186, net_187, net_188, net_189,
         net_190, net_191, net_192, net_193, net_194, net_195, net_196,
         net_197, net_198, net_199, net_200, net_201, net_202, net_203,
         net_204, net_205, net_206, net_207, net_208, net_209, net_210,
         net_211, net_212, net_213, net_214, net_215, net_216, net_217,
         net_218, net_219, net_220, net_221, net_222, net_223, net_224,
         net_225, net_226;
  assign A0 = D0;

  INV3 U134 ( .A(T3), .Q(net_152) );
  INV3 U135 ( .A(T0), .Q(net_134) );
  NAND40 U136 ( .A(net_120), .B(net_121), .C(net_122), .D(net_123), .Q(G1) );
  NAND20 U137 ( .A(net_124), .B(net_125), .Q(net_123) );
  AOI220 U138 ( .A(net_126), .B(net_127), .C(T0), .D(net_128), .Q(net_122) );
  NAND20 U139 ( .A(net_129), .B(net_130), .Q(net_128) );
  IMUX20 U140 ( .A(net_131), .B(net_132), .S(T1), .Q(net_129) );
  NOR20 U141 ( .A(T5), .B(T4), .Q(net_132) );
  OAI210 U142 ( .A(net_131), .B(net_133), .C(net_134), .Q(G0) );
  CLKIN0 U143 ( .A(net_135), .Q(net_131) );
  NAND40 U144 ( .A(net_136), .B(net_137), .C(net_138), .D(net_139), .Q(F1) );
  OAI310 U145 ( .A(net_140), .B(net_141), .C(net_142), .D(net_125), .Q(net_139) );
  NOR20 U146 ( .A(T2), .B(net_143), .Q(net_141) );
  OAI210 U147 ( .A(T4), .B(net_144), .C(net_145), .Q(net_140) );
  AOI210 U148 ( .A(net_146), .B(net_135), .C(net_147), .Q(net_138) );
  CLKIN0 U149 ( .A(net_148), .Q(net_147) );
  IMUX20 U150 ( .A(net_149), .B(net_150), .S(T0), .Q(net_137) );
  NOR20 U151 ( .A(net_151), .B(net_152), .Q(net_150) );
  CLKIN0 U152 ( .A(net_153), .Q(net_149) );
  OAI210 U153 ( .A(net_154), .B(net_155), .C(net_156), .Q(net_153) );
  AOI220 U154 ( .A(net_157), .B(net_158), .C(net_159), .D(net_143), .Q(net_136) );
  CLKIN0 U155 ( .A(net_160), .Q(net_158) );
  OAI210 U156 ( .A(net_151), .B(net_161), .C(net_162), .Q(F0) );
  IMUX20 U157 ( .A(T0), .B(net_163), .S(net_164), .Q(net_162) );
  NOR20 U158 ( .A(T0), .B(net_165), .Q(net_163) );
  AOI310 U159 ( .A(net_166), .B(net_167), .C(net_168), .D(T5), .Q(E1) );
  AOI210 U160 ( .A(net_157), .B(T0), .C(net_169), .Q(net_168) );
  NAND20 U161 ( .A(net_159), .B(T3), .Q(net_167) );
  AOI210 U162 ( .A(net_126), .B(net_151), .C(net_170), .Q(net_166) );
  CLKIN0 U163 ( .A(net_144), .Q(net_126) );
  OAI210 U164 ( .A(net_156), .B(net_171), .C(net_172), .Q(E0) );
  AOI220 U165 ( .A(net_173), .B(net_157), .C(net_174), .D(net_134), .Q(net_172) );
  NAND20 U166 ( .A(net_175), .B(net_176), .Q(D1) );
  IMUX20 U167 ( .A(net_177), .B(net_178), .S(T5), .Q(net_175) );
  OAI2110 U168 ( .A(net_133), .B(net_130), .C(net_148), .D(net_121), .Q(
        net_178) );
  AOI210 U169 ( .A(net_179), .B(T3), .C(net_180), .Q(net_121) );
  OAI310 U170 ( .A(net_127), .B(T0), .C(net_143), .D(net_171), .Q(net_180) );
  NAND20 U171 ( .A(net_181), .B(net_133), .Q(net_148) );
  CLKIN0 U172 ( .A(net_182), .Q(net_177) );
  AOI2110 U173 ( .A(net_152), .B(net_183), .C(net_184), .D(net_169), .Q(
        net_182) );
  OAI210 U174 ( .A(net_185), .B(net_186), .C(net_160), .Q(net_169) );
  IMUX20 U175 ( .A(net_127), .B(net_154), .S(T0), .Q(net_160) );
  OAI2110 U176 ( .A(net_134), .B(net_187), .C(net_188), .D(net_189), .Q(D0) );
  AOI210 U177 ( .A(T2), .B(T1), .C(net_174), .Q(net_189) );
  OAI210 U178 ( .A(T2), .B(net_152), .C(net_190), .Q(net_174) );
  AOI220 U179 ( .A(T5), .B(net_164), .C(net_127), .D(net_133), .Q(net_190) );
  CLKIN0 U180 ( .A(net_187), .Q(net_164) );
  AOI210 U181 ( .A(net_159), .B(net_152), .C(net_146), .Q(net_188) );
  NOR30 U182 ( .A(net_133), .B(net_134), .C(net_185), .Q(net_146) );
  NAND30 U183 ( .A(net_191), .B(net_192), .C(net_193), .Q(C1) );
  NOR40 U184 ( .A(T5), .B(net_181), .C(net_194), .D(net_195), .Q(net_193) );
  CLKIN0 U185 ( .A(net_196), .Q(net_195) );
  NAND30 U186 ( .A(T3), .B(net_134), .C(net_154), .Q(net_196) );
  CLKIN0 U187 ( .A(net_142), .Q(net_192) );
  OAI2110 U188 ( .A(net_134), .B(net_151), .C(net_197), .D(net_198), .Q(
        net_142) );
  NAND20 U189 ( .A(net_173), .B(net_152), .Q(net_197) );
  AOI220 U190 ( .A(net_156), .B(T4), .C(T2), .D(T1), .Q(net_191) );
  OAI2110 U191 ( .A(T1), .B(net_199), .C(net_145), .D(net_200), .Q(C0) );
  NOR20 U192 ( .A(T0), .B(net_184), .Q(net_200) );
  CLKIN0 U193 ( .A(net_201), .Q(net_184) );
  NAND20 U194 ( .A(T3), .B(net_155), .Q(net_145) );
  CLKIN0 U195 ( .A(net_202), .Q(net_199) );
  OAI2110 U196 ( .A(net_152), .B(net_144), .C(net_203), .D(net_204), .Q(B1) );
  NOR20 U197 ( .A(net_205), .B(net_206), .Q(net_204) );
  IMUX20 U198 ( .A(net_207), .B(net_208), .S(T5), .Q(net_206) );
  AOI2110 U199 ( .A(T1), .B(net_183), .C(net_209), .D(net_210), .Q(net_208) );
  OAI210 U200 ( .A(T0), .B(net_161), .C(net_201), .Q(net_210) );
  OAI210 U201 ( .A(T2), .B(net_186), .C(net_211), .Q(net_209) );
  IMUX20 U202 ( .A(net_212), .B(net_185), .S(net_134), .Q(net_183) );
  NOR40 U203 ( .A(net_181), .B(net_159), .C(net_213), .D(net_214), .Q(net_207)
         );
  AOI210 U204 ( .A(net_151), .B(net_215), .C(T1), .Q(net_214) );
  CLKIN0 U205 ( .A(net_173), .Q(net_215) );
  NOR20 U206 ( .A(net_212), .B(T0), .Q(net_173) );
  NOR30 U207 ( .A(net_152), .B(T4), .C(T0), .Q(net_213) );
  CLKIN0 U208 ( .A(net_171), .Q(net_159) );
  NOR20 U209 ( .A(net_216), .B(net_134), .Q(net_181) );
  CLKIN0 U210 ( .A(net_217), .Q(net_203) );
  NOR30 U211 ( .A(net_134), .B(T4), .C(net_161), .Q(net_217) );
  OAI210 U212 ( .A(T4), .B(net_201), .C(net_218), .Q(B0) );
  IMUX20 U213 ( .A(net_202), .B(net_133), .S(T0), .Q(net_218) );
  NAND20 U214 ( .A(net_165), .B(net_212), .Q(net_202) );
  NOR30 U215 ( .A(T4), .B(T5), .C(T3), .Q(net_165) );
  NAND20 U216 ( .A(net_157), .B(net_212), .Q(net_201) );
  OAI2110 U217 ( .A(net_216), .B(net_186), .C(net_176), .D(net_219), .Q(A1) );
  MUX21 U218 ( .A(net_220), .B(net_221), .S(net_125), .Q(net_219) );
  CLKIN0 U219 ( .A(T5), .Q(net_125) );
  AOI210 U220 ( .A(net_127), .B(net_157), .C(net_170), .Q(net_221) );
  NOR20 U221 ( .A(net_161), .B(net_212), .Q(net_170) );
  NAND20 U222 ( .A(net_133), .B(net_152), .Q(net_161) );
  CLKIN0 U223 ( .A(net_198), .Q(net_157) );
  AOI2110 U224 ( .A(T1), .B(net_179), .C(net_124), .D(net_222), .Q(net_220) );
  OAI210 U225 ( .A(net_187), .B(net_134), .C(net_130), .Q(net_222) );
  NAND20 U226 ( .A(T3), .B(net_127), .Q(net_130) );
  NAND20 U227 ( .A(net_212), .B(net_133), .Q(net_187) );
  CLKIN0 U228 ( .A(T1), .Q(net_133) );
  OAI210 U229 ( .A(T0), .B(net_198), .C(net_143), .Q(net_124) );
  NAND20 U230 ( .A(T1), .B(net_152), .Q(net_198) );
  NOR30 U231 ( .A(net_223), .B(net_224), .C(net_205), .Q(net_176) );
  OAI210 U232 ( .A(T1), .B(net_171), .C(net_120), .Q(net_205) );
  CLKIN0 U233 ( .A(net_225), .Q(net_120) );
  OAI210 U234 ( .A(T3), .B(net_211), .C(net_226), .Q(net_225) );
  NAND30 U235 ( .A(T0), .B(net_154), .C(T1), .Q(net_226) );
  NOR20 U236 ( .A(T2), .B(T4), .Q(net_154) );
  IMUX20 U237 ( .A(net_127), .B(net_155), .S(T0), .Q(net_211) );
  NOR20 U238 ( .A(net_185), .B(net_212), .Q(net_155) );
  CLKIN0 U239 ( .A(net_216), .Q(net_127) );
  NAND20 U240 ( .A(net_179), .B(net_134), .Q(net_171) );
  CLKIN0 U241 ( .A(net_151), .Q(net_179) );
  NAND20 U242 ( .A(T2), .B(net_185), .Q(net_151) );
  CLKIN0 U243 ( .A(T4), .Q(net_185) );
  NOR30 U244 ( .A(net_152), .B(T5), .C(net_144), .Q(net_224) );
  NAND20 U245 ( .A(T1), .B(net_134), .Q(net_144) );
  NOR30 U246 ( .A(net_134), .B(T4), .C(net_135), .Q(net_223) );
  NAND20 U247 ( .A(net_152), .B(net_212), .Q(net_135) );
  CLKIN0 U248 ( .A(net_194), .Q(net_186) );
  NOR20 U249 ( .A(net_143), .B(net_134), .Q(net_194) );
  CLKIN0 U250 ( .A(net_156), .Q(net_143) );
  NOR20 U251 ( .A(net_152), .B(T1), .Q(net_156) );
  NAND20 U252 ( .A(T4), .B(net_212), .Q(net_216) );
  CLKIN0 U253 ( .A(T2), .Q(net_212) );
endmodule


// Created by ihdl
module ALU ( A, B, CMD, S ) ;

    input [7:0]A ;
    input [7:0]B ;
    input [2:0]CMD ;
    output [7:0]S ;

    wire nx6, nx18, nx22, nx28, nx36, nx54, nx58, nx66, nx78, nx84, nx90, nx96, 
         nx100, nx102, nx110, nx116, nx136, nx146, nx154, nx160, nx186, nx188, 
         nx190, nx198, nx204, nx224, nx234, nx242, nx248, nx274, nx276, nx278, 
         nx286, nx292, nx312, nx322, nx330, nx336, nx362, nx364, nx366, nx382, 
         nx392, nx291, nx293, nx299, nx301, nx305, nx307, nx317, nx319, nx321, 
         nx323, nx327, nx333, nx341, nx343, nx347, nx359, nx361, nx363, nx365, 
         nx373, nx377, nx383, nx385, nx393, nx399, nx401, nx403, nx405, nx407, 
         nx412, nx415, nx419, nx421, nx426, nx430, nx432, nx434, nx436, nx438, 
         nx443, nx446, nx450, nx452, nx457, nx461, nx463, nx465;



    OAI2111 ix109 (.Q (S[0]), .A (A[0]), .B (nx291), .C (nx293), .D (nx333)) ;
    NAND31 ix292 (.Q (nx291), .A (CMD[0]), .B (CMD[1]), .C (CMD[2])) ;
    NAND21 ix294 (.Q (nx293), .A (nx100), .B (nx102)) ;
    XNR21 ix101 (.Q (nx100), .A (nx6), .B (nx299)) ;
    NOR21 ix7 (.Q (nx6), .A (CMD[2]), .B (CMD[0])) ;
    NOR21 ix55 (.Q (nx54), .A (CMD[2]), .B (nx305)) ;
    XNR21 ix306 (.Q (nx305), .A (CMD[0]), .B (CMD[1])) ;
    AOI211 ix308 (.Q (nx307), .A (B[0]), .B (nx90), .C (nx84)) ;
    NOR21 ix91 (.Q (nx90), .A (CMD[2]), .B (CMD[1])) ;
    OAI311 ix79 (.Q (nx78), .A (nx317), .B (CMD[2]), .C (nx319), .D (nx321)) ;
    CLKIN1 ix318 (.Q (nx317), .A (CMD[0])) ;
    CLKIN1 ix320 (.Q (nx319), .A (CMD[1])) ;
    NAND21 ix322 (.Q (nx321), .A (nx323), .B (nx22)) ;
    XNR21 ix324 (.Q (nx323), .A (A[7]), .B (B[7])) ;
    NOR21 ix23 (.Q (nx22), .A (nx327), .B (CMD[1])) ;
    CLKIN1 ix328 (.Q (nx327), .A (CMD[2])) ;
    NOR31 ix67 (.Q (nx66), .A (nx323), .B (nx327), .C (CMD[0])) ;
    AOI211 ix103 (.Q (nx102), .A (CMD[0]), .B (CMD[1]), .C (CMD[2])) ;
    AOI221 ix334 (.Q (nx333), .A (nx18), .B (nx36), .C (A[0]), .D (nx28)) ;
    XOR21 ix19 (.Q (nx18), .A (A[0]), .B (B[0])) ;
    NOR21 ix37 (.Q (nx36), .A (CMD[0]), .B (nx327)) ;
    OAI211 ix29 (.Q (nx28), .A (nx18), .B (nx341), .C (nx343)) ;
    NAND31 ix344 (.Q (nx343), .A (CMD[0]), .B (CMD[1]), .C (nx327)) ;
    OAI2111 ix153 (.Q (S[1]), .A (A[1]), .B (nx291), .C (nx347), .D (nx365)) ;
    NAND21 ix348 (.Q (nx347), .A (nx146), .B (nx102)) ;
    XNR21 ix147 (.Q (nx146), .A (nx136), .B (nx359)) ;
    XNR21 ix97 (.Q (nx96), .A (nx54), .B (nx307)) ;
    XNR21 ix360 (.Q (nx359), .A (A[1]), .B (nx361)) ;
    XOR21 ix362 (.Q (nx361), .A (nx54), .B (nx363)) ;
    AOI211 ix364 (.Q (nx363), .A (B[1]), .B (nx90), .C (nx84)) ;
    AOI221 ix366 (.Q (nx365), .A (nx110), .B (nx36), .C (A[1]), .D (nx116)) ;
    XOR21 ix111 (.Q (nx110), .A (A[1]), .B (B[1])) ;
    OAI211 ix117 (.Q (nx116), .A (nx110), .B (nx341), .C (nx343)) ;
    OAI2111 ix197 (.Q (S[2]), .A (A[2]), .B (nx291), .C (nx373), .D (nx385)) ;
    NAND21 ix374 (.Q (nx373), .A (nx190), .B (nx102)) ;
    XNR21 ix191 (.Q (nx190), .A (nx377), .B (nx188)) ;
    IMAJ30 ix378 (.Q (nx377), .A (nx136), .B (A[1]), .C (nx361)) ;
    XNR21 ix189 (.Q (nx188), .A (A[2]), .B (nx186)) ;
    XNR21 ix187 (.Q (nx186), .A (nx54), .B (nx383)) ;
    AOI211 ix384 (.Q (nx383), .A (B[2]), .B (nx90), .C (nx84)) ;
    AOI221 ix386 (.Q (nx385), .A (nx154), .B (nx36), .C (A[2]), .D (nx160)) ;
    XOR21 ix155 (.Q (nx154), .A (A[2]), .B (B[2])) ;
    OAI211 ix161 (.Q (nx160), .A (nx154), .B (nx341), .C (nx343)) ;
    OAI2111 ix241 (.Q (S[3]), .A (A[3]), .B (nx291), .C (nx393), .D (nx407)) ;
    NAND21 ix394 (.Q (nx393), .A (nx234), .B (nx102)) ;
    XNR21 ix235 (.Q (nx234), .A (nx224), .B (nx401)) ;
    IMAJ30 ix225 (.Q (nx224), .A (nx377), .B (nx399), .C (nx186)) ;
    CLKIN1 ix400 (.Q (nx399), .A (A[2])) ;
    XNR21 ix402 (.Q (nx401), .A (A[3]), .B (nx403)) ;
    XOR21 ix404 (.Q (nx403), .A (nx54), .B (nx405)) ;
    AOI211 ix406 (.Q (nx405), .A (B[3]), .B (nx90), .C (nx84)) ;
    AOI221 ix408 (.Q (nx407), .A (nx198), .B (nx36), .C (A[3]), .D (nx204)) ;
    XOR21 ix199 (.Q (nx198), .A (A[3]), .B (B[3])) ;
    OAI211 ix205 (.Q (nx204), .A (nx198), .B (nx341), .C (nx343)) ;
    OAI2111 ix285 (.Q (S[4]), .A (A[4]), .B (nx291), .C (nx412), .D (nx421)) ;
    NAND21 ix413 (.Q (nx412), .A (nx278), .B (nx102)) ;
    XNR21 ix279 (.Q (nx278), .A (nx415), .B (nx276)) ;
    IMAJ30 ix416 (.Q (nx415), .A (nx224), .B (A[3]), .C (nx403)) ;
    XNR21 ix277 (.Q (nx276), .A (A[4]), .B (nx274)) ;
    XNR21 ix275 (.Q (nx274), .A (nx54), .B (nx419)) ;
    AOI211 ix420 (.Q (nx419), .A (B[4]), .B (nx90), .C (nx84)) ;
    AOI221 ix422 (.Q (nx421), .A (nx242), .B (nx36), .C (A[4]), .D (nx248)) ;
    XOR21 ix243 (.Q (nx242), .A (A[4]), .B (B[4])) ;
    OAI211 ix249 (.Q (nx248), .A (nx242), .B (nx341), .C (nx343)) ;
    OAI2111 ix329 (.Q (S[5]), .A (A[5]), .B (nx291), .C (nx426), .D (nx438)) ;
    NAND21 ix427 (.Q (nx426), .A (nx322), .B (nx102)) ;
    XNR21 ix323 (.Q (nx322), .A (nx312), .B (nx432)) ;
    IMAJ30 ix313 (.Q (nx312), .A (nx415), .B (nx430), .C (nx274)) ;
    CLKIN1 ix431 (.Q (nx430), .A (A[4])) ;
    XNR21 ix433 (.Q (nx432), .A (A[5]), .B (nx434)) ;
    XOR21 ix435 (.Q (nx434), .A (nx54), .B (nx436)) ;
    AOI211 ix437 (.Q (nx436), .A (B[5]), .B (nx90), .C (nx84)) ;
    AOI221 ix439 (.Q (nx438), .A (nx286), .B (nx36), .C (A[5]), .D (nx292)) ;
    XOR21 ix287 (.Q (nx286), .A (A[5]), .B (B[5])) ;
    OAI211 ix293 (.Q (nx292), .A (nx286), .B (nx341), .C (nx343)) ;
    OAI2111 ix373 (.Q (S[6]), .A (A[6]), .B (nx291), .C (nx443), .D (nx452)) ;
    NAND21 ix444 (.Q (nx443), .A (nx366), .B (nx102)) ;
    XNR21 ix367 (.Q (nx366), .A (nx446), .B (nx364)) ;
    IMAJ30 ix447 (.Q (nx446), .A (nx312), .B (A[5]), .C (nx434)) ;
    XNR21 ix365 (.Q (nx364), .A (A[6]), .B (nx362)) ;
    XNR21 ix363 (.Q (nx362), .A (nx54), .B (nx450)) ;
    AOI211 ix451 (.Q (nx450), .A (B[6]), .B (nx90), .C (nx84)) ;
    AOI221 ix453 (.Q (nx452), .A (nx330), .B (nx36), .C (A[6]), .D (nx336)) ;
    XOR21 ix331 (.Q (nx330), .A (A[6]), .B (B[6])) ;
    OAI211 ix337 (.Q (nx336), .A (nx330), .B (nx341), .C (nx343)) ;
    NAND21 ix399 (.Q (S[7]), .A (nx457), .B (nx465)) ;
    OAI211 ix458 (.Q (nx457), .A (nx90), .B (nx6), .C (nx392)) ;
    XOR41 ix393 (.Q (nx392), .A (nx382), .B (A[7]), .C (nx54), .D (nx463)) ;
    IMAJ30 ix383 (.Q (nx382), .A (nx446), .B (nx461), .C (nx362)) ;
    CLKIN1 ix462 (.Q (nx461), .A (A[6])) ;
    AOI211 ix464 (.Q (nx463), .A (B[7]), .B (nx90), .C (nx84)) ;
    AOI2111 ix466 (.Q (nx465), .A (A[7]), .B (nx78), .C (nx66), .D (nx58)) ;
    NOR21 ix59 (.Q (nx58), .A (A[7]), .B (nx291)) ;
    CLKIN1 ix302 (.Q (nx301), .A (nx96)) ;
    CLKIN1 ix85 (.Q (nx84), .A (nx465)) ;
    CLKIN1 ix342 (.Q (nx341), .A (nx22)) ;
    XOR21 ix300 (.Q (nx299), .A (A[0]), .B (nx96)) ;
    MAJ31 ix137 (.Q (nx136), .A (nx6), .B (A[0]), .C (nx301)) ;
endmodule

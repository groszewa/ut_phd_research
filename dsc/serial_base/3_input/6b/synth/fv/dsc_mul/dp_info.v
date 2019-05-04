module increment_unsigned_GENERIC_REAL(A, CI, Z);
// synthesis_equation increment_unsigned
  input [17:0] A;
  input CI;
  output [17:0] Z;
  wire [17:0] A;
  wire CI;
  wire [17:0] Z;
  wire n_38, n_39, n_40, n_41, n_42, n_43, n_44, n_45;
  wire n_46, n_47, n_48, n_49, n_50, n_51, n_52, n_53;
  wire n_54;
  xor g1 (Z[0], A[0], CI);
  and g2 (n_38, A[0], CI);
  xor g18 (Z[1], A[1], n_38);
  and g19 (n_39, A[1], n_38);
  xor g20 (Z[2], A[2], n_39);
  and g21 (n_40, A[2], n_39);
  xor g22 (Z[3], A[3], n_40);
  and g23 (n_41, A[3], n_40);
  xor g24 (Z[4], A[4], n_41);
  and g25 (n_42, A[4], n_41);
  xor g26 (Z[5], A[5], n_42);
  and g27 (n_43, A[5], n_42);
  xor g28 (Z[6], A[6], n_43);
  and g29 (n_44, A[6], n_43);
  xor g30 (Z[7], A[7], n_44);
  and g31 (n_45, A[7], n_44);
  xor g32 (Z[8], A[8], n_45);
  and g33 (n_46, A[8], n_45);
  xor g34 (Z[9], A[9], n_46);
  and g35 (n_47, A[9], n_46);
  xor g36 (Z[10], A[10], n_47);
  and g37 (n_48, A[10], n_47);
  xor g38 (Z[11], A[11], n_48);
  and g39 (n_49, A[11], n_48);
  xor g40 (Z[12], A[12], n_49);
  and g41 (n_50, A[12], n_49);
  xor g42 (Z[13], A[13], n_50);
  and g43 (n_51, A[13], n_50);
  xor g44 (Z[14], A[14], n_51);
  and g45 (n_52, A[14], n_51);
  xor g46 (Z[15], A[15], n_52);
  and g47 (n_53, A[15], n_52);
  xor g48 (Z[16], A[16], n_53);
  and g49 (n_54, A[16], n_53);
  xor g50 (Z[17], A[17], n_54);
endmodule

module increment_unsigned_GENERIC(A, CI, Z);
  input [17:0] A;
  input CI;
  output [17:0] Z;
  wire [17:0] A;
  wire CI;
  wire [17:0] Z;
  increment_unsigned_GENERIC_REAL g1(.A (A), .CI (CI), .Z (Z));
endmodule


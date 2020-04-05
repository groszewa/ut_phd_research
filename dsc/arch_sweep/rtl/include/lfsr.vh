module lfsr16 #(parameter FLAVOR=0)(
 output reg [15:0] countval,
 output reg overflow,                                   
 input             en,
 input             clk,
 input             rst
);

   

reg [15:0] lfsr;
wire linear_feedback;
assign linear_feedback = lfsr[15];

initial begin
  if(FLAVOR==0) begin
    lfsr <= 16'haaaa;
  end
  else if (FLAVOR==1) begin
    lfsr <= 16'hffff;  
  end
 assign overflow = 0;  
end

     
always @(posedge clk) begin
  countval <= lfsr;
  //out <= lfsr[0];
  if (rst) begin
    if(FLAVOR==0) begin
       lfsr <= 16'haaaa;
    end
    else if(FLAVOR==1) begin
       lfsr <= 16'hffff;
    end
    countval <= lfsr;
    //out <= 1;
  end else if (en) begin
      lfsr[0] <= linear_feedback;
      lfsr[1] <= lfsr[0];
      lfsr[2] <= lfsr[1];
      lfsr[3] <= lfsr[2];
      lfsr[4] <= lfsr[3] ^ linear_feedback;
      lfsr[5] <= lfsr[4] ^ linear_feedback; 
      lfsr[6] <= lfsr[5] ^ linear_feedback;
      lfsr[7] <= lfsr[6];
      lfsr[8] <= lfsr[7];
      lfsr[9] <= lfsr[8];
      lfsr[10] <= lfsr[9];
      lfsr[11] <= lfsr[10];
      lfsr[12] <= lfsr[11];
      lfsr[13] <= lfsr[12];
      lfsr[14] <= lfsr[13];
      lfsr[15] <= lfsr[14];
  end // if (en)
end
endmodule // lfsr16



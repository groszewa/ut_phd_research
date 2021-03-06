//use custom CLOG2 macro which is synthesizable
`ifndef __MODULES__
`define __MODULES__

`define CLOG2(x)  \
	(x<=1)    ? 0   : \
	(x<=2)    ? 1   : \
	(x<=4)    ? 2   : \
	(x<=8)    ? 3   : \
	(x<=16)   ? 4   : \
	(x<=32)   ? 5   : \
	(x<=64)   ? 6   : \
	(x<=128)  ? 7   : \
	(x<=256)  ? 8   : \
	(x<=512)  ? 9   : \
	(x<=1024) ? 10  : -1

`define STRIDE_OVERFLOW_LSB(stride,width) \
        (stride==1) ? 0 : \
        (stride==2) ? 1 : \
        (stride==4) ? ((width==2) ? 0 : 2 ) : -1

`include "counters.vh"
`include "adders.vh"
`include "parallel_acc.vh"
`include "sng.vh"      
`include "cas.vh" 

`endif

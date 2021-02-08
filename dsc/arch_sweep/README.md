- build 
  --> Collateral directory for designs, need to run make.sh to populate
- rtl
  * params.vh        
    --> file with top level params overwritten by make.sh
  * modules.v        
    --> shared modules common to all designs
  * dsc_serial_mul.v 
    --> serial multiply, traditional DSC
  * es_naive_mul.v   
    --> serial multiply with early shutoff
- script
  - mkfiles
    * /sim/Makefile   
      --> Makefile for simulations tasks
    * /synth/Makefile 
      --> Makefile for synthesis tasks
  * gscl45nm.lib 
    -->
  * arch.sdc     
    -->
  * clean.sh     
    -->
  * check_ok.sh  
    -->
  * compile.sh   
    -->
  * synth.sh     
    -->
  * rc.tcl       
    -->
  *make.sh       
   -->
- testbench
  * tb_top.sv            
    -->
  * dsc_serial_mul_tb.sv 
    -->
  * es_naive_mul_tb.sv   
    -->

Git stuff:
git config credential.helper store
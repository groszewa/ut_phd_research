module {{ data.get('design') }}_synth (
    clk,
    rst,
    en,
    bin_data_in,
    bin_data_out,
    done
);

	input  [{{ data.get('data_width')-1 }}:0] bin_data_in [{{ data.get('num_inputs')-1 }}:0];
	input  clk,rst,en;

	output [{{ data.get('wxip1')-1 }}:0] bin_data_out;
	output done;
   
        {{ data.get('design') }} #(.DATA_WIDTH({{ data.get('data_width') }}), .NUM_INPUTS({{ data.get('num_inputs') }}), .WXIP1({{ data.get('wxip1') }})) TOP(.*);

endmodule // {{ data.get('design') }}_synth

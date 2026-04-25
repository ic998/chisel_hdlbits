`timescale 1ns/1ps 

module tb ();

	reg clk, areset, predict_valid, train_valid, train_taken, train_mispredicted;
	reg [6:0] predict_pc, train_history, train_pc;
	wire [6:0] predict_history;
	wire predict_taken;
	GsharePredictor dut(.*);

	initial clk = 0;
	always #5 clk=~clk;

	initial begin
		areset = 1;
		predict_valid=1;
		predict_pc='ha;
		train_valid = 0;

		@(negedge clk) areset = 0;
		repeat(2) @(posedge clk);
		train_valid = 1;
		train_taken = 1;
		train_mispredicted = 1;
		train_history = 0;
		train_pc = 'ha;
		@(posedge clk); train_valid = 0;
		@(posedge clk); train_valid = 1;
		train_history = 'h10;
		train_pc = 'ha;
		repeat(5) @(posedge clk);
		$stop();
		$finish(0);
	end 
endmodule 

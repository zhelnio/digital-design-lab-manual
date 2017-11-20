// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
`timescale 1ns/1ns
module testbench;
    // input and output test signals

	reg clk;
	reg reset;
	reg push;
	reg pop;
	reg [7:0] write_data;
	wire [7:0] read_data;

    // creating the instance of the module we want to test
    //  lab7_4_1 - module name
    //  dut  - instance name ('dut' means 'device under test')
    lab7_4_1 dut (clk, reset, push, pop, write_data, read_data);
	
initial 
	begin
		// set inital values of signal
		clk = 1;
		reset = 1;
		push = 1;
		pop = 0;
		write_data = 8'b00000000; 
		
		// write data in RAM
		#20; 					     			    // pause
			write_data = 8'b00000001;
		#10;
			reset = 0;
		#10; 					     			    // pause
			write_data = 8'b00000010;
		#20; 					     			    // pause
			write_data = 8'b00000011;
		#20; 					     			    // pause
			write_data = 8'b00000100;
		#20; 					     			    // pause
			write_data = 8'b00000101;
		#20; 					     			    // pause
			write_data = 8'b00000110;
			push = 0;
			pop = 1;
		#20; 					     			    // pause
			write_data = 8'b00000111;
		#20; 					     			    // pause
			write_data = 8'b00001000;
		#20; 					     			    // pause
			write_data = 8'b00001001;
		#20; 					     			    // pause
			write_data = 8'b00001011;
	end
	
	//every 10 ns invert clk 
	always #10 clk = ~clk;


	initial 
		#220 $finish;
	
   // do at the beginning of the simulation
   // print signal values on every change
   initial 
       $monitor("clk=%b reset=%b push=%b pop=%b write_data=%b read_data=%b", 
			clk, reset, push, pop, write_data, read_data);

   // do at the beginning of the simulation
   initial 
       $dumpvars;  //iverilog dump init

endmodule

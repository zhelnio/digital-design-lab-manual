module lab7_2

#(parameter DATA_WIDTH=6, parameter ADDR_WIDTH=4)

(
	input clk,							// key for manual clk
	input [(ADDR_WIDTH-1):0] addr,
	output [(DATA_WIDTH-1):0] data_out,
	output [(ADDR_WIDTH-1):0] addr_out
);

	// ROM array
	reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];
	
	// invert chip select signal and clk button
	wire w_clk = ~ clk;
	
	reg [ADDR_WIDTH-1:0] addr_reg;

	
	// read ROM content from file
	initial begin
		$readmemh("../rom.txt",rom);
	end
	
	always @ (posedge w_clk)
	begin
	   addr_reg <= addr;
	end
	 
   assign data_out = rom[addr_reg];
	assign addr_out = addr_reg;
	
endmodule

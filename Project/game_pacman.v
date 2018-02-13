module game_pacman(
	CLOCK_50,
	KEY,
	HEX0,
	VGA_R,
	VGA_G,
	VGA_B,
	VGA_HS,
	VGA_VS,
	VGA_BLANK_N,
	VGA_SYNC_N,
	VGA_CLK
);

	input  CLOCK_50;
	input [3:0]	KEY;
	output[6:0]	HEX0;
	output[7:0] VGA_R;
	output[7:0] VGA_G;
	output[7:0] VGA_B;
	output		VGA_HS;
	output		VGA_VS;
	output		VGA_BLANK_N;
	output		VGA_SYNC_N;
	output		VGA_CLK;
	
	reg   [2:0] colour = 0;	
	reg	[8:0] x = 0; 
	reg   [7:0] y = 0;	 
	reg	[3:0]	KEY_out;
	
keycontrol k1( .clk(CLOCK_50),
					.KEY(KEY),
					.KEY_out(KEY_out)
					);


datapath d1( .clk(CLOCK_50),
				 .KEY(KEY_out),
				 .HEX0(HEX0),
				 .x(x),
				 .y(y),
				 .colour(colour)
				 );

vga_adapter u1(
			.resetn(1'b1),
			.clock(CLOCK_50),
			.colour(colour),
			.x(x), 
			.y(y),
			.plot(1'b1),
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK_N),
			.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));

endmodule
	
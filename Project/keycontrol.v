module keycontrol(
	clk,
	KEY,
	KEY_out
);

	input clk;
	input [3:0]	KEY;
	output reg	[3:0]	KEY_out = 0;		
	reg		[3:0]	KEY_q = 0;		
	reg		[3:0]	KEY_d1 = 0;		
	reg		[3:0]	KEY_d2 = 0;		
	reg		[29:0] cnt_100hz = 0;	
	reg		clk_100hz = 0;	

	always @(posedge clk) begin
		if(cnt_100hz < 250000)		
			cnt_100hz <= cnt_100hz + 1;	
		else begin					
			clk_100hz <= ~clk_100hz;
			cnt_100hz <= 0;
		end
	end

	always @(posedge clk_100hz) begin
		KEY_d1 <= KEY;				
		KEY_d2 <= KEY | KEY_d1;		
	end
	
	always@(posedge clk)	begin
		KEY_q <= KEY_d2;				
		KEY_out <= ~KEY_d2 & KEY_q;
	end

endmodule
	
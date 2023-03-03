module booth2 (
    input  wire        clk  ,
	input  wire        rst_n,
	input  wire [15:0] x    ,
	input  wire [15:0] y    ,
	input  wire        start,
	output reg  [31:0] z    ,
	output wire        busy 
);

reg start_flag;
reg [17:0] X1;
reg [17:0] X2;
reg [34:0] Z;
reg [34:0] temp;
reg [ 5:0] cnt;
reg zero;
assign busy = start_flag;

//启动开关
always@(posedge clk or negedge rst_n)
begin
   if(~rst_n)
      start_flag <= 1'd0;
   else if(start)
      start_flag <= 1'd1;
   else if(cnt == 6'd8)
      start_flag <= 1'd0;
   else
      start_flag <= start_flag; 
end

//booth乘法器
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        X1 <= 18'd0;
        X2 <= 18'd0;
        Z <= 35'd0;
        zero <= 1'd0;
    end
    else if(start)
    begin
        X1[15:0] = x;
        X1[16] = x[15];
        X1[17] = x[15];
        X2[15:0] = ~x + 1'd1;
        X2[16] = ~x[15];
        X2[17] = ~x[15];
        Z = {18'd0,y,1'd0};
        temp = {18'd0,y,1'd0};
        if(x == 16'd0 || y == 16'd0)
            zero <= 1'd1;
        else
            zero <= 1'd0;
    end
    else if(start_flag)
    begin
        if(cnt >= 6'd0 && cnt < 6'd7)
        begin
            if(Z[2:0] == 3'b001 || Z[2:0] == 3'b010)
                Z[34:17] = temp[34:17] + X1;
            else if(Z[2:0] == 3'b101 || Z[2:0] == 3'b110)
                Z[34:17] = temp[34:17] + X2;
            else if(Z[2:0] == 3'b011)
                Z[34:17] = temp[34:17] + X1 + X1;
            else if(Z[2:0] == 3'b100)
                Z[34:17] = temp[34:17] + X2 + X2;
            temp = {Z[34],Z[34],Z[34:2]};
            Z = temp;
        end
        else if(cnt == 6'd7)
        begin
             if(Z[1:0] == 2'b01)
                 Z[34:17] = temp[34:17] + X1;
             else if(Z[1:0] == 2'b10)
                 Z[34:17] = temp[34:17] + X2;
             temp = {Z[34],Z[34:1]};
            Z = temp;
        end
        else if(cnt == 6'd8)
        begin
             if(Z[1:0] == 2'b01)
                 Z[34:17] = temp[34:17] + X1;
             else if(Z[1:0] == 2'b10)
                 Z[34:17] = temp[34:17] + X2;
             if(zero)
                 z = 32'd0;
             else
                 z = Z[33:2];
        end
    end
end

//cnt计数器
always@(posedge clk or negedge rst_n)
begin
   if(~rst_n)
       cnt <= 6'd0;
   else if(start_flag && cnt <= 6'd8)
       cnt <= cnt + 1'd1;
   else 
       cnt <= 6'd0;
end

endmodule

module traffic_light (
    input  clk,
    input  reset,
    output reg red,
    output reg yellow,
    output reg green
);

    parameter RED = 2'b00,
              GREEN = 2'b01,
              YELLOW = 2'b10;

    reg [1:0] state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= RED;
        else begin
            case (state)
                RED:    state <= GREEN;
                GREEN:  state <= YELLOW;
                YELLOW: state <= RED;
                default: state <= RED;
            endcase
        end
    end

    always @(*) begin
        red    = 1'b0;
        yellow = 1'b0;
        green  = 1'b0;

        case (state)
            RED:    red    = 1'b1;
            GREEN:  green  = 1'b1;
            YELLOW: yellow = 1'b1;
            default: red    = 1'b1;
        endcase
    end

endmodule

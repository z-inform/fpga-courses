# Мультиплексор 7-to-1

## Компиляция

### Код модуля мультиплексора

```verilog

    module mux_71 (a, b, c, d, e, f, g, select, out);
        input a, b, c, d, e, f, g;
        input [2:0] select;
        output out;
        
        wire [6:0] in = {g, f, e, d, c, b, a};
        assign out = in[select];
    endmodule

```

### Результат синтеза

![RTL view](synth.png)

## Симуляция с использованием тестового бенча

### Код тестирующего модуля

```verilog

    module mux_71_tb;
        reg a, b, c, d, e, f, g;
        reg [2:0] select;
        wire out;
        integer i;
        
        mux_71 testable ( .a(a), .b(b), .c(c), .e(e), .d(d), .f(f), .g(g), .select(select), .out(out));
        
        initial begin
            select <= 0;
            a <= 1;
            b <= 1;
            c <= 0;
            d <= 0;
            e <= 1;
            f <= 1;
            g <= 1;
            
            for (i = 1; i < 8; i = i + 1) begin
                #5
                select <= i;
            end
        end
    endmodule

```

### Результат симуляции

![Результаты симуляции](sim.png)

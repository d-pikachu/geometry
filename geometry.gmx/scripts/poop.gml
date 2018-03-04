var llt = argument0;
var la = normal(line(llt[X1], llt[Y1], llt[X2], llt[Y2]));
var    lb = normal(line(llt[X2], llt[Y2], llt[X3], llt[Y3]));
var    lc = normal(line(llt[X1], llt[Y1], llt[X3], llt[Y3]));
    draw_line_pika(la);
    draw_line_pika(lb);
    draw_line_pika(lc);

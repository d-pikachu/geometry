var t = argument0;
p1 = point((t[X1]+t[X2])/2, (t[Y1]+t[Y2])/2)
p2 = point((t[X2]+t[X3])/2, (t[Y2]+t[Y3])/2)
p3 = point((t[X1]+t[X3])/2, (t[Y1]+t[Y3])/2)

draw_set_color(c_red)
draw_line(p1[X],p1[Y],t[CX],t[CY]);
draw_line(p2[X],p2[Y],t[CX],t[CY]);
draw_line(p3[X],p3[Y],t[CX],t[CY]);
draw_set_color(c_black)

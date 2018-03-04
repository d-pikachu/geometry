///FILL
draw_set_alpha(0.1)
draw_set_color(argument1)
draw_primitive_begin(pr_trianglestrip);
draw_vertex(argument0[X1], argument0[Y1]);
draw_vertex(argument0[X2], argument0[Y2]);
draw_vertex(argument0[X3], argument0[Y3]);
draw_primitive_end();
draw_set_color(c_black)
draw_set_alpha(1)

//EDGES
draw_line(argument0[X1], argument0[Y1], argument0[X2], argument0[Y2]);
draw_line(argument0[X3], argument0[Y3], argument0[X2], argument0[Y2]);
draw_line(argument0[X1], argument0[Y1], argument0[X3], argument0[Y3]);

//VERTEX
draw_point_pika(point(argument0[X1], argument0[Y1]))
draw_point_pika(point(argument0[X2], argument0[Y2]))
draw_point_pika(point(argument0[X3], argument0[Y3]))

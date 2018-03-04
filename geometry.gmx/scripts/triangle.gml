var t;
t[X1] = argument0[X];
t[Y1] = argument0[Y];
t[X2] = argument1[X];
t[Y2] = argument1[Y];
t[X3] = argument2[X];
t[Y3] = argument2[Y];

t[CX] = circumcircle_x(t)
t[CY] = circumcircle_y(t)
t[CR] = point_distance(t[CX],t[CY],t[X1],t[Y1])

return t

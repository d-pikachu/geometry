///scr_triangle_circumcircle_x( x1, y1, x2, y2, x3, y3 )

var t = argument0;

var a = sqr(t[X1]) + sqr(t[Y1]);
var b = sqr(t[X2]) + sqr(t[Y2]);
var c = sqr(t[X3]) + sqr(t[Y3]);

var cx = a*( t[Y3] - t[Y2] ) + b*( t[Y1] - t[Y3] ) + c*( t[Y2] - t[Y1] );
cx /= t[X1]*( t[Y3] - t[Y2] ) + t[X2]*( t[Y1] - t[Y3] ) + t[X3]*( t[Y2] - t[Y1] );
cx *= 0.5;

return cx;

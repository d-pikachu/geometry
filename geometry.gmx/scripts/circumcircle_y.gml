///scr_triangle_circumcircle_x( x1, y1, x2, y2, x3, y3 )

var t = argument0;

var a = sqr(t[X1]) + sqr(t[Y1])
var b = sqr(t[X2]) + sqr(t[Y2])
var c = sqr(t[X3]) + sqr(t[Y3])

var cy = a*( t[X3] - t[X2] ) + b*( t[X1] - t[X3] ) + c*( t[X2] - t[X1] );
cy /= t[Y1]*( t[X3] - t[X2] ) + t[Y2]*( t[X1] - t[X3] ) + t[Y3]*( t[X2] - t[X1] );
cy *= 0.5;

return cy;


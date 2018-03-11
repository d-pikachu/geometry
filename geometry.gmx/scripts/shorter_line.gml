xx1 = argument0[X1]
yy1 = argument0[Y1]
xx2 = argument0[X2]
yy2 = argument0[Y2]

da = point_direction(xx1 , yy1, xx2, yy2);
db = point_direction(xx2 , yy2, xx1, yy1);

xx1 += lengthdir_x(argument1, da)
yy1 += lengthdir_y(argument1, da)

xx2 += lengthdir_x(argument1,db)
yy2 += lengthdir_y(argument1,db)

return line(xx1, yy1,xx2,yy2)

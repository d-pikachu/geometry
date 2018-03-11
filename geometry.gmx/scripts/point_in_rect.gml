//returns if point is inside rect
//arguments 1 and 2 rect's top left coordinatess
//arguments 3 and 4 rect's bottom right coordinatess
//arguments 5 and 6 point's coordinatess
var xx1 = argument0 , 
yy1 = argument1 , 
xx2 = argument2 , 
yy2 = argument3 , 
px = argument4 ,
py = argument5 

return (px >= min(xx1, xx2) && px <= max(xx1, xx2)
and py >= min(yy1, yy2) && py <= max(yy1, yy2))

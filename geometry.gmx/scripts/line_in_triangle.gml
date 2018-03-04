///argument0: line
//argument1 : triangle

var _ll = argument0;
var _ltl = 0;
_ltl[0] = line(argument1[X1], argument1[Y1], argument1[X2], argument1[Y2]);
_ltl[1] = line(argument1[X2], argument1[Y2], argument1[X3], argument1[Y3]);
_ltl[2] = line(argument1[X3], argument1[Y3], argument1[X1], argument1[Y1]);

/*
if same_line(_ll, _ltl[0]) return 1;
else if same_line(_ll, _ltl[1]) return 2;
else if same_line(_ll, _ltl[2]) return 3;
else return 0;*/

return same_line(_ll, _ltl[0]) or same_line(_ll, _ltl[1]) or same_line(_ll, _ltl[2]) 


//take 2 lines as a argument
// returns point, point[X] as false if not intersecting

var line_a_xx1 = argument0[X1] ,
line_a_yy1 = argument0[Y1] ,
line_a_xx2 = argument0[X2] ,
line_a_yy2 = argument0[Y2] ,
line_b_xx1 = argument1[X1] ,
line_b_yy1 = argument1[Y1] ,
line_b_xx2 = argument1[X2] ,
line_b_yy2 = argument1[Y2];


var I = point(0,0); 
I[X] = NADA;

var dax = (line_a_xx1-line_a_xx2), dbx = (line_b_xx1-line_b_xx2);
var day = (line_a_yy1-line_a_yy2), dby = (line_b_yy1-line_b_yy2);

var Den = dax*dby - day*dbx;
if (Den == 0) 
{
    I[X] = NADA;
    return I;
}

var aa = (line_a_xx1 * line_a_yy2 - line_a_yy1 * line_a_xx2);
var bb = (line_b_xx1 * line_b_yy2 - line_b_yy1 * line_b_xx2);

I[X] = ( aa*dbx - dax*bb ) / Den;
I[Y] = ( aa*dby - day*bb ) / Den;

  
if point_in_rect(line_a_xx1,line_a_yy1,line_a_xx2,line_a_yy2,I[X],I[Y])
and  point_in_rect(line_b_xx1,line_b_yy1,line_b_xx2,line_b_yy2,I[X],I[Y])
return I;
else 
{
    I[X] = NADA;
    return I;
}

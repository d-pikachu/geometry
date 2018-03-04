//argument 0 : line
//slope
var rise = argument0[Y2]-argument0[Y1];
var run = argument0[X2]-argument0[X1]
if run==0 run=0.0001
var m = rise/run;
if m==0 m=0.0001;
m=-1/m;

var p_mid = line_mid(argument0)

// y = m(x-x1) + y1
// x = ((y-y1)/m)+x1
var p_=-1;

//ww = W
//hh = H
ww = room_width
hh = room_height
p_[0] = point(0 , (m*(0 - p_mid[X]))+ p_mid[Y])
p_[1] = point(ww , (m*(ww - p_mid[X]))+ p_mid[Y])
p_[2] = point(((0-p_mid[Y])/m)+ p_mid[X], 0)
p_[3] = point(((hh-p_mid[Y])/m)+ p_mid[X], hh)


var l_t=0, //local index
e_p=-1; //end points
for(i=0 ; i<=3 ; ++i) {
    c_p = p_[i] //current_point
    if is_in_range(c_p[X],0,ww) and is_in_range(c_p[Y],0,hh) {
        e_p[l_t] = c_p
        l_t++;
    }
}

//for the love of pee poo god fix thiss!!!!!
var ra = e_p[0];
var rb = e_p[1];

return line(ra[X], ra[Y], rb[X], rb[Y]);

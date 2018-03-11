var pp = argument0
var tt = argument1
var rr = 0
if pp[X]==tt[X1] and pp[Y]==tt[Y1] {
    rr[0] = point(tt[X2], tt[Y2]);
    rr[1] = point(tt[X3], tt[X3])
    return rr;
}
if pp[X]==tt[X2] and pp[Y]==tt[Y2] {
    rr[0] = point(tt[X1], tt[Y1]);
    rr[1] = point(tt[X3], tt[X3])
    return rr;
}
if pp[X]==tt[X3] and pp[Y]==tt[Y3] {
    rr[0] = point(tt[X2], tt[Y2]);
    rr[1] = point(tt[X1], tt[X1])
    return rr;
}

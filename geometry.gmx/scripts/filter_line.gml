// takes array replaces duplicates with NIL(-1) macro
/*
var l=len(argument0),
t=0,
nil= line(point(NIL,NIL),point(NIL,NIL)),
arr = NIL; 

for(i=0; i<l; ++i) {

    cl = argument0[i]   //cl : current line
    for(j=i; j<l; ++j) {
        
        ol = argument0[j] //ol : other line
        if i!=j  and same_line(cl, ol) and ol[0]!=NIL
            {
                argument0[j] = nil;
            }
    }
}

for(i=0; i<l; ++i) {
    if !same_line(argument0[i],nil) {
        arr[t] = argument0[i];
        t++;
    }
}
    
//return arr;
return arr;
*/

var _site = argument0;
var _tri = argument1;
var sitesrr = argument2;
var _res = NADA;
var temp_data = NADA;
var my_tri = NADA;
var flag = NADA;
var _region = NADA;
for(var _t=0; _t<len(_tri); ++_t) {
    if vertex_of_triangle(_site, _tri[_t]) {
        loc_tri = _tri[_t]
        
        if point_in_line(_site, loc_tri[V1]) {
            temp_data = NADA;
            temp_data[0] = _t;
            temp_data[1] = V1;
            _res[len(_res)] = temp_data;
        }
        
        if point_in_line(_site, loc_tri[V2]) {
            temp_data = NADA;
            temp_data[0] = _t;
            temp_data[1] = V2;
            _res[len(_res)] = temp_data;
        }
        
        if point_in_line(_site, loc_tri[V3]) {
            temp_data = NADA;
            temp_data[0] = _t;
            temp_data[1] = V3;
            _res[len(_res)] = temp_data;
        }
     }
     
}

//////////////////////////////////////////////////////////////////////
doubly = NADA;
singly = NADA;
for(_la=0; _la<len(_res); ++_la){

    _flag = true;
    da = NADA; ta = da; ;la = da;
    da = _res[_la];
    ta = tri[da[0]];
    la = ta[da[1]];
    for(_lb=0; _lb<len(_res); ++_lb){
        if _la == _lb continue;
        
        db = NADA; tb = db; ;lb = db;
        db = _res[_lb];
        tb = tri[db[0]];
        lb = tb[db[1]];
        
        //if _flag and same_line(la,lb) {
        if same_line(la,lb) {
        _flag=false;
        }
    }
    if _flag {
    singly[len(singly)] = da
     _region[len(_region)] = point(ta[CX], ta[CY])
    }
    else {
    doubly[len(doubly)] = da
    //voronoi vertex from doubly
    _region[len(_region)] = point(ta[CX], ta[CY])
    }
}

//////////////////////////////////////////////////////////////////////////////
//SORTING 11
temp = NADA;
for(_t=0; _t<len(_region); ++_t){
loc_pnt = _region[_t]
temp[_t] = point_direction(_site[X], _site[Y], loc_pnt[X], loc_pnt[Y])
}

temp2=NADA;
temp3=NADA;
for (_i = 0; _i < len(_region); _i++){
    //flag = true
    for (_j = 0; _j < len(_region); _j++){
        if _i!=_j and temp[_i]!=NADA and temp[_i]==temp[_j] {
           temp[_j] = NADA; 
           //flag = false;
           break;
        }
    }
    //if flag {
        //temp2[len(temp2)] = _region[_i]
        //temp3[len(temp3)] = temp[_i]
    //}
}
for (_i = 0; _i < len(_region); _i++) {

    if temp[_i] != NADA {
        temp2[len(temp2)] = _region[_i]
        temp3[len(temp3)] = temp[_i]
    }
}
_region = temp2

temp = NADA;
for(_t=0; _t<len(_region); ++_t){
loc_pnt = _region[_t]
temp[_t] = point_direction(_site[X], _site[Y], loc_pnt[X], loc_pnt[Y])
}


for (_i = 1; _i < len(_region); _i++)
   {
       _key = temp[_i];
       _r_key = _region[_i]
       _j = _i-1;
        
       while (_j >= 0 && temp[_j] > _key)
       {
           temp[_j+1] = temp[_j];
            _region[_j+1] = _region[_j];
           _j = _j-1;
       }
       temp[_j+1] = _key;
       _region [_j+1] = _r_key ;
}


///////////////////////////////////////////////////////////////////////////////
edg = NADA
for(_i=1; _i<len(_region); ++_i){
    
    _p1 = _region[_i]
    _p2 = _region[_i-1]
    edg[len(edg)] = line(_p1[X], _p1[Y], _p2[X], _p2[Y])
}
if len(_region)>2{
    _p1 = _region[0]
    _p2 = _region[len(_region)-1]
    edg[len(edg)] = line(_p1[X], _p1[Y], _p2[X], _p2[Y])
}

/////////////////////////////////////////////////////////////////////////
//vertex from singly
//ver = NADA
ver = NADA
for(var _la=0; _la<len(singly); ++_la){
    da = NADA; ta = da; ;la = da;
    da = singly[_la];
    ta = tri[da[0]];
    la = ta[da[1]];
    
    temp_n = normal(la)
    ver[len(ver)] = point(temp_n[X1], temp_n[Y1]);
    ver[len(ver)] = point(temp_n[X2], temp_n[Y2]);
    edg[len(edg)] = line(ta[CX], ta[CY], temp_n[X1], temp_n[Y1]);
    edg[len(edg)] = line(ta[CX], ta[CY], temp_n[X2], temp_n[Y2])
}

if 1{
    ver[len(ver)] = point(0,0)
    ver[len(ver)] = point(room_width,0)
    ver[len(ver)] = point(0,room_height)
    ver[len(ver)] = point(room_width,room_height)
}
pee = NADA
for(_i=0 ; _i<len(ver); ++_i){
    
        t_la = ver[_i]
        t_la = line(_site[X], _site[Y], t_la[X], t_la[Y])
        flag = true
    for(_j=0 ; _j<len(edg); ++_j){
       // if _i==_j continue;
        temp = line_intersection(shorter_line(t_la,0.1),shorter_line(edg[_j],0.1))
        //temp = line_intersection(t_la,edg[_j])
        //if temp[X]!=false draw_point_pika(temp)
         if temp[X]!=NADA {
         ver[_i] = point(NADA,NADA);
         break;
         }
        
        /*if temp[X]==false{
            flag = false;
            pee[len(pee)] = nails[_i]
            break;
        }*/
    }
   // if flag==false{
            
   // }
}

for(_i=0 ; _i<len(ver); ++_i) 
    if !same_point(ver[_i], point(NADA,NADA))
        //pee[len(pee)] = ver[_i]
        _region[len(_region)] = ver[_i]

        
//////////////////////////////////////////////////////////////////////////////
//SORTING
temp = NADA;
for(_t=0; _t<len(_region); ++_t){
loc_pnt = _region[_t]
temp[_t] = point_direction(_site[X], _site[Y], loc_pnt[X], loc_pnt[Y])
}

temp2=NADA;
temp3=NADA;
for (_i = 0; _i < len(_region); _i++){
    //flag = true
    for (_j = 0; _j < len(_region); _j++){
        if _i!=_j and temp[_i]!=NADA and temp[_i]==temp[_j] {
           temp[_j] = NADA; 
           //flag = false;
           break;
        }
    }
    //if flag {
        //temp2[len(temp2)] = _region[_i]
        //temp3[len(temp3)] = temp[_i]
    //}
}
for (_i = 0; _i < len(_region); _i++) {

    if temp[_i] != NADA {
        temp2[len(temp2)] = _region[_i]
        temp3[len(temp3)] = temp[_i]
    }
}
_region = temp2

temp = NADA;
for(_t=0; _t<len(_region); ++_t){
loc_pnt = _region[_t]
temp[_t] = point_direction(_site[X], _site[Y], loc_pnt[X], loc_pnt[Y])
}


for (_i = 1; _i < len(_region); _i++)
   {
       _key = temp[_i];
       _r_key = _region[_i]
       _j = _i-1;
        
       while (_j >= 0 && temp[_j] > _key)
       {
           temp[_j+1] = temp[_j];
            _region[_j+1] = _region[_j];
           _j = _j-1;
       }
       temp[_j+1] = _key;
       _region [_j+1] = _r_key ;
}


///////////////////////////////////////////////////////////////////////////////
if 1{
if len(_region)>0{
    draw_primitive_begin(pr_trianglefan);
    draw_set_alpha(0.5)
    draw_set_color(c_red)
    ttemp = _region[0]
     //draw_vertex(ttemp[X], ttemp[Y])
    draw_vertex(_site[X], _site[Y])
     for(_ii = 0; _ii < len(_region); ++_ii)
        {
        ttemp = _region[_ii]
        draw_vertex(ttemp[X], ttemp[Y]);
        }
            if len(_region)>0{
            ttemp = _region[0]
            draw_vertex(ttemp[X], ttemp[Y]);
            }
    draw_set_alpha(1)
    draw_set_color(c_black)    
    draw_primitive_end();
}
/*if len(_region)>0 {
    _region = delaunay_pika_new(_region , min_point, max_point)
    for(_r=0 ; _r<len(_region); ++_r) {
         draw_triangle_pika(_region[_r] , c_red)
    }
}*/
for(_r=0 ; _r<len(_region); ++_r) draw_point_square(_region[_r], 8)
}
///////////////////////////////////////////////////////////////////////////////
for(var _la=0; _la<len(singly); ++_la){
    da = NADA; ta = da; ;la = da;
    da = singly[_la];
    ta = tri[da[0]];
    la = ta[da[1]];
    draw_set_color(c_red); draw_line_pika(la); draw_set_color(c_black)
}

for(var _la=0; _la<len(doubly); ++_la){
    da = NADA; ta = da; ;la = da;
    da = doubly[_la];
    ta = tri[da[0]];
    la = ta[da[1]];
    draw_set_color(c_green); draw_line_pika(la); draw_set_color(c_black)

}
//_res = doubly;
//return doubly
return temp3
return _region
///return _res











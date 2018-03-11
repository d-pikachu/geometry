var site = argument0
var tri = argument1
var pnts = argument2
var res = 0

var my_tri =0
for(var t=0; t<len(tri); ++t) {
    if vertex_of_triangle(site, tri[t]) {
        my_tri = insert(my_tri, tri[t]);
    }
}

var pnts_count = len(pnts)
var my_tri_count = len(my_tri);

if my_tri_count==0 {
    /*nearest_distance = 999999
    var buddy = noone
    for(var t=0; t < pnts_count; ++t) {
        if !same_point(pnts[t], site) {
            var tp = pnts[t]
            temp_distance = point_distance(site[X], site[Y], tp[X], tp[Y]);
            if temp_distance < nearest_distance {
                buddy = tp;
                nearest_distance = temp_distance;
            }
        }    
    }
    draw_line(buddy[X],buddy[Y],site[X],site[Y])
    */
}


else {
    //get_edges
    var my_edges = 0;
    for(var t=0; t < my_tri_count; ++t) {
        temp_s1 = sister_vertex_triangle(site, my_tri[t])
        temp_s2 = temp_s1[1]
        temp_s1 = temp_s1[0]
        my_edges = insert(my_edges, line(site[X], site[Y], temp_s1[X], temp_s2[Y]));
        my_edges = insert(my_edges, line(site[X], site[Y], temp_s2[X], temp_s2[Y]));
    }
    //draw_text(site[X],site[Y]-27,string(len(my_edges)));
    
    //sort
    var my_edges_count = len(my_edges);
    var singly = 0, doubly=0;
    for(var t=0; t < my_edges_count; ++t) {
        flag = 0
        for(var ti=t; ti < my_edges_count; ++ti) {
            if t!=ti {
            
                if same_line(my_edges[t], my_edges[ti]) {
                    flag=1
                }
            }
        }
        if flag 
            doubly = insert(doubly,my_edges[t])
    }
    draw_text(site[X],site[Y]-27,string(len(doubly)));
    //remove samies
    //for(var t=0; t<len(doubly); ++t) {}
}




























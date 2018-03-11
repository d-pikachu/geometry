var sites = argument0,
min_pnt = point(argument1[X]-1,argument1[Y]-1),
max_pnt = point(argument2[X]+1,argument2[Y]+1),
tris = NADA,
vertices = NADA,
bad_tris = NADA,
//site = NADA,
tri = NADA,
d_tris = NADA;
//---------------------------------------------------------------------------------//

//super triangle
tris[len(tris)] = triangle(min_pnt, point(max_pnt[X], 0), point(0, max_pnt[Y]));
tris[len(tris)] = triangle(max_pnt, point(max_pnt[X], 0), point(0, max_pnt[Y]));

//---------------------------------------------------------------------------------//

var site_num = len(sites);
for(var _site=0; _site < site_num; ++_site){

    
    var tris_num = len(tris);
    var site = sites[_site];
     bad_tris = NADA;
    for(var _tri=0; _tri < tris_num; ++_tri) {
        tri = tris[_tri];
        if point_distance(site[X], site[Y], tri[CX], tri[CY]) <= tri[CR] {
            bad_tris[len(bad_tris)] = tri;
            //bad_tris = insert(bad_tris, tri)\
        }
    }
    
    //remove bad triangles from main list
    var bad_tris_num = len(bad_tris);
    for(var _tris=0; _tris < bad_tris_num; ++_tris) 
            tris = remove_triangle(tris, bad_tris[_tris]);
        
    var unique_edges = NADA;
    for(var _bad_tri_a=0; _bad_tri_a < bad_tris_num; ++_bad_tri_a) {
        var flag=NADA; 
        flag[0]=true 
        flag[1]=true
        flag[2]=true
        bad_tri = bad_tris[_bad_tri_a];
        for(var _bad_tri_b=0; _bad_tri_b < bad_tris_num; ++_bad_tri_b) {
                
            if _bad_tri_a == _bad_tri_b continue;
            
            if flag[0] and line_in_triangle(bad_tri[V1], bad_tris[_bad_tri_b]) flag[0]=false;
            if flag[1] and line_in_triangle(bad_tri[V2], bad_tris[_bad_tri_b]) flag[1]=false;
            if flag[2] and line_in_triangle(bad_tri[V3], bad_tris[_bad_tri_b]) flag[2]=false;
        }   
        
        if flag[0] unique_edges[len(unique_edges)] = bad_tri[V1];
        if flag[1] unique_edges[len(unique_edges)] = bad_tri[V2];
        if flag[2] unique_edges[len(unique_edges)] = bad_tri[V3];
    }
    
    
    var len_unique_edges = len(unique_edges);
    for(var _edge=0; _edge < len_unique_edges; ++_edge) {
        edge = unique_edges[_edge];
        tris[len(tris)] = triangle(site, point(edge[X1], edge[Y1]), point(edge[X2], edge[Y2]))
    }
}
var len_tris = len(tris);
for(var _tri=0; _tri < len_tris; ++_tri) 
    if !border_triangle(tris[_tri], min_pnt, max_pnt)
        d_tris[len(d_tris)] = tris[_tri];

return d_tris;


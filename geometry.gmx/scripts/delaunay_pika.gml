var _points = argument0;
var _min_point = point(argument1[X]-1,argument1[Y]-1);
var _max_point = point(argument2[X]+1,argument2[Y]+1);

var _triangles = 0;

_tria = triangle(_min_point, point(_max_point[X], 0), point(0, _max_point[Y]));
_triangles = insert(_triangles,_tria)
_trib = triangle(_max_point, point(_max_point[X], 0), point(0, _max_point[Y]));
_triangles = insert(_triangles,_trib)

//_triangles = remove_triangle(_triangles,_trib)

var _p_count = len(_points);

for(_p=0; _p<_p_count; ++_p) {

    var _cp = _points[_p]; //current point
    var _bad_triangle = 0;
    
    var _t_count = len(_triangles)
    for(var _t=0; _t < _t_count; ++_t) {
        
        var _ct = _triangles[_t] //current triangle
        if point_distance(_cp[X], _cp[Y], _ct[CX], _ct[CY]) <= _ct[CR]
            _bad_triangle = insert(_bad_triangle, _ct)
    }
    
    
    var _line=0;
    var _bt_count = len(_bad_triangle);
    for(_bt=0; _bt<_bt_count; ++_bt) {
        
        var _cbt = _bad_triangle[_bt] //current bad triangle
        var _cbtl = 0; //current bad triangle edges
        _cbtl[0] = line(_cbt[X1], _cbt[Y1], _cbt[X2], _cbt[Y2]);
        _cbtl[1] = line(_cbt[X2], _cbt[Y2], _cbt[X3], _cbt[Y3]);
        _cbtl[2] = line(_cbt[X3], _cbt[Y3], _cbt[X1], _cbt[Y1]);
        var flag=0;
        flag[0] = true;
        flag[1] = true;
        flag[2] = true;
        
        for(_bt2=0; _bt2<_bt_count; ++_bt2) {
            
            if _bt==_bt2 continue;
            
            if (flag[0]) and line_in_triangle(_cbtl[0], _bad_triangle[_bt2]) 
                flag[0] = false;
            if (flag[1]) and line_in_triangle(_cbtl[1], _bad_triangle[_bt2]) 
                flag[1] = false;
            if (flag[2]) and line_in_triangle(_cbtl[2], _bad_triangle[_bt2]) 
                flag[2] = false;
        }
        
        if flag[0] _line = insert(_line , _cbtl[0]);
        if flag[1] _line = insert(_line , _cbtl[1]);
        if flag[2] _line = insert(_line , _cbtl[2]);
    }
    
    
    var _bt_count = len(_bad_triangle);
    for(_bt=0; _bt<_bt_count; ++_bt) {
    
        _triangles = remove_triangle(_triangles, _bad_triangle[_bt]);
    }
    
    
    var _l_count = len(_line);
    for(_l=0 ; _l < _l_count; ++_l) {
        _cl = _line[_l]; //current line
        _l_tri = triangle(_cp, point(_cl[X1],_cl[Y1]), point(_cl[X2],_cl[Y2]));
        _triangles = insert(_triangles, _l_tri);
    }
}

if 1 {
    

    //Remove triangles that lie around the edge
    var _result = 0;
    var _t_count = len(_triangles);
    for(_t=0; _t<_t_count; ++_t) {
          
              c_t = _triangles[_t];
                //_result = remove_triangle(_result, c_t)
                if !border_triangle(c_t, _min_point, _max_point)
                _result = insert(_result, c_t)
    }
}

//return _triangles;
return _result;

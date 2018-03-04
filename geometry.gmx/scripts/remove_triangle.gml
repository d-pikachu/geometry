//argument0 : array, argument1 : stuff to remove
var _a_size = len(argument0);
var _result = 0;

for(_i=0 ; _i<_a_size; ++_i) {
    if !same_triangle(argument0[_i], argument1)
    _result[len(_result)] = argument0[_i];
}
return _result

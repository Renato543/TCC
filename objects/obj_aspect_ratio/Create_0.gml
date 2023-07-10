var _base_w = 320;
var _base_h = 180; 

display_set_gui_size(_base_w, _base_h);
display_set_gui_maximize(4, 4, 0, 0);

var _display_w = display_get_width();
var _display_h = display_get_height();

var _aspect = _display_w/_display_h;

if(_display_w < _display_h) {
	var _final_width = min(_base_w, _display_w);
	var _final_height = _final_width/_aspect;
}
else { 
	var _final_height = min(_base_h, _display_h);
	var _final_width = _final_height * _aspect;	
}

camera_set_view_size(view_camera[0], _final_width, _final_height);
view_wport[0] = _display_w;
view_hport[0] = _display_h;

surface_resize(application_surface, _display_w, _display_h);


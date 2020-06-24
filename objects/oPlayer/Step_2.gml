/// @description 
// Camera follow
var cam_w = 1280;
var cam_h = 720;

var cX = camera_get_view_x(view_camera), cY = camera_get_view_y(view_camera);
cX = lerp(cX, x - cam_w/2, 0.1);
cY = lerp(cY, y - cam_h/2, 0.1);
cX = clamp(cX, 0, room_width-cam_w);
cY = clamp(cY, 0, room_height-cam_h);

camera_set_view_pos(view_camera, cX, cY);
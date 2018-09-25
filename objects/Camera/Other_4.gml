/// @description 
cam = view_get_camera(view_current);
if(instance_exists(Player)) {
	x = Player.x;
	y = Player.y;
	
	camera_set_view_pos(cam,x-camw/2,y-camh/2);;
}
/// @description 
if(instance_exists(Player)) {
	x = lerp(x,Player.x,0.4);
	y = lerp(y,Player.y-16,0.2);
	
	camera_set_view_pos(cam,x-camw/2,y-camh/2);;
} else {
	camera_set_view_pos(cam,0,0);
}
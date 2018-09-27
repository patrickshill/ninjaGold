/// @description

//Scarf
if(!surface_exists(scarfSurf)) {
	scarfSurf = surface_create(48,48);
	
}
surface_set_target(scarfSurf);
draw_clear_alpha(c_white,0);
draw_sprite_ext(spr_scarf,0,16-(2*facing),24,max(1,max(1.4,1.2*(abs(vx)/vxMax))),1,(scarfAngleOffset)+scarfAngle,image_blend,image_alpha);
surface_reset_target();
draw_surface(scarfSurf,x-16,y-32);


//sheath
draw_sprite_ext(spr_playerSheath,0,x,y+sheath_yoff,facing,1,image_angle,image_blend,image_alpha);

draw_sprite_ext(sprite_index,image_index,x,y,xscale*facing,yscale,image_angle,image_blend,image_alpha);

//Debug
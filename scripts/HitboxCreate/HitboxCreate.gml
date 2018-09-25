/// @desc HitboxCreate(xoff,yoff,width,height,life,xhit,yhit,dmg);
/// @param xoff
/// @param yoff
/// @param width
/// @param height
/// @param life
/// @param xhit
/// @param y hit

var hb = instance_create_layer(x+argument0,y+argument1,"Instances",obj_hitbox);
	hb.owner = id;
	hb.xoff = argument0;
	hb.yoff = argument1;
	hb.image_xscale = argument2;
	hb.image_yscale = argument3;
	hb.life = argument4;
	hb.xhit = argument5;
	hb.yhit = argument6;
	hb.dmg = argument7;

return hb.id;
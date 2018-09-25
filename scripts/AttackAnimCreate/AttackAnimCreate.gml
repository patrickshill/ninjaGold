/// @desc AttackAnimCreate(sprite,xoff,yoff);
/// @param sprite
/// @param xoff
/// @param yoff

var ani = instance_create_depth(x+argument1,y+argument2,depth-10,obj_attackAnimation);
	ani.owner = id;
	ani.image_xscale = facing;
	ani.sprite_index = argument0;
	ani.xoff = argument1;
	ani.yoff = argument2;

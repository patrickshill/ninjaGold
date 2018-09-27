/// @desc CreateDust(sprite,x,y,xscale,yscale);
/// @param sprite
/// @param x
/// @param y
/// @param xscale
/// @param yscale

var dust = instance_create_depth(argument1,argument2,depth+10,obj_dust);
dust.sprite_index = argument0;
dust.facing = facing;
dust.xscale = argument3;
dust.yscale = argument4;
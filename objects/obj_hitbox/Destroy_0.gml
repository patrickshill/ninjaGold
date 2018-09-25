/// @description 
ds_list_destroy(hitList);
if(instance_exists(owner)) {
	owner.hitbox = -1;
}
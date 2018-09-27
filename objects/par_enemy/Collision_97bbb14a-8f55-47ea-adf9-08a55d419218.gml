/// @description
var hit = false;
with(other) {
	for(var i=0;i<ds_list_size(hitList);i++) {
		if(hitList[|i] == other.id) {
			hit = true;
		}
	}
}

if(!hit) {
	hp -= other.dmg;
	ds_list_add(other.hitList,id);
	vx = other.xhit;
	vy = other.yhit;
	if(canStun) {
		hitStun = other.stun;
	}
	Shake(other.shakeAmt,other.shakeDur);
}
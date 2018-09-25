/// @description 
xscale = Approach(xscale, 1, 0.04);
yscale = Approach(yscale, 1, 0.04);

repeat(abs(vx)) {
	if(!place_meeting(x+sign(vx),y,obj_solid)) {
		x += sign(vx);
	} else {
		vx = 0;
		break;
	}
}
repeat(abs(vy)) {
	if(!place_meeting(x,y+sign(vy),obj_solid)) {
		y += sign(vy);
	} else {
		vy = 0;
		break;
	}
}
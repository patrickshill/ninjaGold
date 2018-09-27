/// @description 
xscale = Approach(xscale, 1, 0.04);
yscale = Approach(yscale, 1, 0.04);
sheath_yoff = Approach(sheath_yoff,0,0.25);

//Scarf sin animation
if(state_current(playerState) == PlayerIdle) {
	var dirOff = (facing > 0)? 50 : 130;
	scarfAngleOffset = Approach(scarfAngleOffset,dirOff,2);
	scarfInc = Approach(scarfInc,1,1);
} else {
	scarfInc = Approach(scarfInc,10,2);
	var d = point_direction(xprev,yprev-8,x,y-8);
	scarfAngleOffset = d;
	xprev = x;
	yprev = y;
}
scarfT = (scarfT + scarfInc) mod 360;
scarfAngle = scarfAmp*sin(degtorad(scarfT));


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
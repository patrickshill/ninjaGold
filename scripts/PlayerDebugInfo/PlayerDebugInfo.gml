FontSet(fnt_debug,fa_left,fa_top,c_white);

draw_text(
	16,16,
	"State: " + string(state_currentString()) + "\n"+
	"VX: " + string(vx) + "\n" +
	"VY: " + string(vy) + "\n" +
	"JNUM: " + string(jNum) + "\n" +
	"DASHT: " + string(dashT) + "\n" +
	"CANTHROW: " + string(throwT) + "\n" +
	"AttackT: " + string(canAirAttack)
)
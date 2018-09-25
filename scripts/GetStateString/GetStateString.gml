switch(state) {
	case pState.idle:	return "Idle"; break;
	case pState.run:	return "Run"; break;
	case pState.jump:	return "Jump"; break;
	case pState.dash:	return "Dash"; break;
	case pState.dashJump: return "DashJump"; break;
	case pState.c1:		return "Combo 1"; break;
	case pState.c2:		return "Combo 2"; break;
	case pState.c3:		return "Combo 3"; break;
}
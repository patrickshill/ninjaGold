switch(playerState[sm.curr_state]) {
	case PlayerIdle:		return "Idle"; break;
	case PlayerRun:			return "Run"; break;
	case PlayerJump:		return "Jump"; break;
	case PlayerDash:		return "Dash"; break;
	case PlayerDashJump:	return "DashJump"; break;
	case PlayerWallSlide:	return "WallSlide"; break;
	case PlayerWallJump:	return "WallJump"; break;
	case PlayerWallRun:		return "WallRun"; break;
	case PlayerMeleeCombo1:		return "Combo 1"; break;
	case PlayerMeleeCombo2:		return "Combo 2"; break;
	case PlayerMeleeCombo3:		return "Combo 3"; break;
}
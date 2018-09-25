/// @parm stateMachine
var _stateMachine = argument0;
_stateMachine[@ sm.is_exiting] = false;
return _stateMachine[@ sm.call_count] == 0;
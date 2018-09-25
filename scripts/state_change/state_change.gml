/// @param stateMachine
/// @param newState

var _stateMachine = argument0;
_stateMachine[@ sm.prev_state] = _stateMachine[@ sm.curr_state];
_stateMachine[@ sm.curr_state] = argument1;
_stateMachine[@ sm.is_exiting] = true;
_stateMachine[@ sm.call_count] = -1;
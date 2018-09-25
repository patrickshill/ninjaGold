/// @desc state_execute(stateMachine);
var _stateMachine	= argument0;
var _currState		= _stateMachine[sm.curr_state];

script_execute(_currState,_stateMachine);

_stateMachine[@ sm.is_exiting] = false;

_stateMachine[@ sm.call_count] += 1;
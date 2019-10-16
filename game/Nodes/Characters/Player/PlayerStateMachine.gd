extends "res://Nodes/Characters/StateMachine.gd"

func _ready():
	states_map = {
		"move": $Move,
		"dash": $Dash,
		"mid_air": $MidAir,
		"on_wall": $OnWall,
		"ground_attack": $GroundAttack,
		"dash_attack": $DashAttack,
		"air_attack": $AirAttack	
	}

func _change_state(state_name):
	if not _active:
		return

	if state_name in ["mid_air", "dash", "ground_attack", "air_attack"]:
		#print(">>>>> " + states_map[state_name].name)
		states_stack.push_front(states_map[state_name])

	._change_state(state_name)

func _input(event):
	current_state.handle_input(event)
	